import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/cache/cache_policy.dart';
import '../../../../core/cache/cache_store.dart';
import '../models/message_model.dart';

class HiveCacheStore<K, V> extends CacheStore<K, V> {
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
    policy.keys.remove(key);
    policy.keys.add(key);
    await _saveKeys();
  }

  @override
  Future<void> put(K key, V value) async {
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
  Future<V?> get(K key) async {
    final value = _box.get(key) as V?;
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
  Future<List<V>> getAll() async {
    await _loadKeys();
    final values = <V>[];
    for (var key in policy.keys) {
      final value = _box.get(key);
      if (value != null) values.add(value as V);
    }
    return values;
  }

  @override
  Future<void> clear() async {
    await _box.clear();
    policy.keys.clear();
    await _saveKeys();
  }

  @override
  Future<String> addMessage(K key, V message) async {
    final singleMessage = message as MessageModel;

    final current = (await get(key)) as List<MessageModel>? ?? [];
    current.add(singleMessage);

    await put(key, current as V);

    return 'Message added in $key';
  }

  @override
  Future<void> removeMessage(K key, String messageId) async {
    final current = (await get(key)) as List<MessageModel>? ?? [];
    current.removeWhere((msg) => msg.id == messageId);
    await put(key, current as V);
  }

  @override
  Future<void> clearMessages(K key) async {
    await put(key, [] as V);
  }

}
