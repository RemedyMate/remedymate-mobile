import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/cache/cache_policy.dart';
import '../../../../core/cache/cache_store.dart';
import '../models/message_model.dart';

class HiveCacheStore<K> implements CacheStore<K, List<MessageModel>> {
  final Box _box;
  final CachePolicy policy;

  HiveCacheStore(this._box, this.policy);

  Future<List> _loadKeys() async {
    final saved = _box.get('__cache_keys__') as List<dynamic>?;
    if (saved != null) {
      policy.keys
        ..clear()
        ..addAll(saved.cast<K>());
    }
    return policy.keys;
  }

  Future<void> _saveKeys() async {
    await _box.put('__cache_keys__', policy.keys);
  }

  Future<void> _evictIfNeeded() async {
    await _loadKeys();
    while (policy.keys.length > policy.maxItems) {
      final victim = policy.keys.first;
      await _box.delete(victim);
      policy.keys.removeAt(0);
      await _saveKeys();
    }
  }

  Future<void> _updateAccessOrder(K key) async {
    if (policy.keys.contains(key)) {
      policy.keys.remove(key);
    } else {
      policy.keys.add(key);
    }
    policy.keys.add(key);
    await _saveKeys();
  }

  @override
  Future<void> put(K key, List<MessageModel> value) async {
    await _evictIfNeeded();
    await _box.put(key, value);

    if (policy.evictionPolicy == EvictionPolicy.lru) {
      await _updateAccessOrder(key);
    } else if (!policy.keys.contains(key)) {
      policy.keys.add(key);
      await _saveKeys();
    }
  }

  @override
  Future<List<MessageModel>?> get(K key) async {
    final value = (_box.get(key) as List<dynamic>?)?.cast<MessageModel>();
    if (value != null && policy.evictionPolicy == EvictionPolicy.lru) {
      await _updateAccessOrder(key);
    }
    return value;
  }

  @override
  Future<void> remove(K key) async {
    await _box.delete(key);
    policy.keys.remove(key);
    await _saveKeys();
  }

  @override
  Future<List<List<MessageModel>>> getAll() async {
    await _loadKeys();
    final values = <List<MessageModel>>[];
    debugPrint('All sessions keys are: ${policy.keys}');
    for (var key in policy.keys) {
      final value = (_box.get(key) as List<dynamic>?)?.cast<MessageModel>();
      if (value != null) values.add(value);
    }
    return values;
  }

  @override
  Future<void> clear() async {
    await _box.clear();
    policy.keys.clear();
    await _saveKeys();
  }

  // ===== Message-specific methods =====

  @override
  Future<String> addMessage(K key, List<MessageModel> messages) async {
    final current = (await get(key)) ?? [];
    current.addAll(messages); // add multiple messages

    try {
      await put(key, current);
      return 'Messages added in $key';
    } on Exception catch (e) {
      return 'Failed to add messages: $e';
    }
  }

  @override
  Future<void> removeMessage(K key, String messageId) async {
    final current = (await get(key)) ?? [];
    current.removeWhere((msg) => msg.id == messageId);
    await put(key, current);
  }

  @override
  Future<void> clearMessages(K key) async {
    await put(key, []);
  }
}
