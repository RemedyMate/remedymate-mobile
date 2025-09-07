import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/cache/cache_policy.dart';
import '../../../../core/cache/cache_store.dart';
import '../models/chat_message_model.dart';

class HiveCacheStore<K> implements CacheStore<K, List<ChatMessageModel>> {
  final Box _box;
  final CachePolicy policy;

  HiveCacheStore(this._box, this.policy);

  Future<List<K>> _loadKeys() async {
    debugPrint('[_loadKeys] - Start. policy.keys before load: ${policy.keys}');
    final saved = _box.get('__cache_keys__') as List<dynamic>?;
    if (saved != null) {
      debugPrint('[_loadKeys] - Found raw saved keys (List<dynamic>): $saved');

      // Add this line to explicitly check the result of cast<K>()
      final List<K> castedKeys = saved.cast<K>();
      debugPrint('[_loadKeys] - Result of saved.cast<K>(): $castedKeys');

      policy.keys
        ..clear()
        ..addAll(castedKeys); // Use the explicitly casted list

      debugPrint(
        '[_loadKeys] - policy.keys after clear and add: ${policy.keys}',
      );
    } else {
      debugPrint(
        '[_loadKeys] - No saved keys found. policy.keys remains: ${policy.keys}',
      );
    }
    return policy.keys
        .cast<
          K
        >(); // This cast might also be problematic, let's keep it for now but focus above
  }

  Future<void> _saveKeys() async {
    await _box.put('__cache_keys__', policy.keys);
    debugPrint('[_saveKeys] - saving keys to Hive: ${policy.keys}');
  }

  Future<void> _evictIfNeeded() async {
    debugPrint(
      '[_evictIfNeeded] - Before _loadKeys call. policy.keys: ${policy.keys}',
    );
    await _loadKeys(); // This re-populates policy.keys
    debugPrint(
      '[_evictIfNeeded] - After _loadKeys call. policy.keys: ${policy.keys}',
    );
    debugPrint(
      '[_evictIfNeeded] - Current cache size: ${policy.keys.length}, Max cache size: ${policy.maxItems}',
    );
    while (policy.keys.length > policy.maxItems) {
      final victim = policy.keys.first;
      debugPrint('[_evictIfNeeded] - Evicting victim: $victim');
      await _box.delete(victim);
      policy.keys.removeAt(0);
      await _saveKeys();
    }
    debugPrint('[_evictIfNeeded] - End. policy.keys: ${policy.keys}');
  }

  Future<void> _updateAccessOrder(K key) async {
    if (policy.keys.contains(key)) {
      policy.keys.remove(key);
    }
    policy.keys.add(key);
    await _saveKeys();
  }

  @override
  Future<void> put(K key, List<ChatMessageModel> value) async {
    debugPrint(
      '[put] - Key: $key. Before _evictIfNeeded. policy.keys: ${policy.keys}',
    );
    await _evictIfNeeded();
    debugPrint(
      '[put] - Key: $key. After _evictIfNeeded. policy.keys: ${policy.keys}',
    );

    final encoded = value.map((m) => m.toJson()).toList();
    await _box.put(key, encoded);

    if (policy.evictionPolicy == EvictionPolicy.lru) {
      await _updateAccessOrder(key);
    } else {
      if (!policy.keys.contains(key)) {
        policy.keys.add(key);
        debugPrint(
          '[put] - Added new key to policy.keys (non-LRU): $key. Current policy.keys: ${policy.keys}',
        );
      }
      await _saveKeys();
    }
    debugPrint('[put] - Key: $key. End. policy.keys: ${policy.keys}');
  }

  @override
  Future<List<ChatMessageModel>?> get(K key) async {
    debugPrint(
      '[get] - Key: $key. Before Hive get. policy.keys: ${policy.keys}',
    );
    final raw = _box.get(key) as List<dynamic>?;
    if (raw == null) {
      debugPrint('[get] - Key: $key. No data found.');
      return null;
    }
    print('Raw data from Hive for key $key: $raw');

    final value = raw
        .map(
          (json) => ChatMessageModel.fromJson(Map<String, dynamic>.from(json)),
        )
        .toList();

    if (policy.evictionPolicy == EvictionPolicy.lru) {
      await _updateAccessOrder(key);
    }
    debugPrint('[get] - Key: $key. End. policy.keys: ${policy.keys}');
    return value;
  }

  @override
  Future<void> remove(K key) async {
    debugPrint(
      '[remove] - Key: $key. policy.keys before removal: ${policy.keys}',
    );
    await _box.delete(key);
    policy.keys.remove(key);
    await _saveKeys();
    debugPrint(
      '[remove] - Key: $key. policy.keys after removal: ${policy.keys}',
    );
  }

  @override
  Future<List<List<ChatMessageModel>>> getAll() async {
    debugPrint(
      '[getAll] - Start. policy.keys before _loadKeys: ${policy.keys}',
    );
    await _loadKeys();
    debugPrint('[getAll] - After _loadKeys. policy.keys: ${policy.keys}');
    final values = <List<ChatMessageModel>>[];
    debugPrint('All sessions keys are: ${policy.keys}');
    for (var key in policy.keys) {
      final raw = _box.get(key) as List<dynamic>?;
      print('Raw data from Hive for key $key: $raw');
      if (raw != null) {
        final value = raw
            .map(
              (json) =>
                  ChatMessageModel.fromJson(Map<String, dynamic>.from(json)),
            )
            .toList();
        values.add(value);
      }
    }
    print(
      '+++++++++++++++++++++ All cached conversations are: $values +++++++++++++++++++++',
    );
    debugPrint('[getAll] - End. policy.keys: ${policy.keys}');
    return values;
  }

  @override
  Future<void> clear() async {
    debugPrint('[clear] - Start. policy.keys before clear: ${policy.keys}');
    await _box.clear();
    policy.keys.clear();
    await _saveKeys();
    debugPrint('[clear] - End. policy.keys after clear: ${policy.keys}');
  }

  // ===== Message-specific methods =====

  @override
  Future<String> addMessage(K key, List<ChatMessageModel> messages) async {
    debugPrint('[addMessage] - Key: $key. policy.keys: ${policy.keys}');
    final current = (await get(key)) ?? [];
    current.addAll(messages);
    try {
      await put(key, current);
      return 'Messages added in $key';
    } on Exception catch (e) {
      return 'Failed to add messages: $e';
    } catch (e) {
      return 'Failed to add messages: $e';
    }
  }

  @override
  Future<void> removeMessage(K key, String messageId) async {
    final current = (await get(key)) ?? [];
    current.removeWhere((msg) {
      if (msg is FollowUpAnswerMessageModel) return msg.followUpId == messageId;
      if (msg is FollowUpMessageModel) return msg.followUpId == messageId;
      // GuideMessageModel has no followUpId → skip
      return false;
    });
    await put(key, current);
  }

  @override
  Future<void> clearMessages(K key) async {
    await put(key, []);
  }
}
