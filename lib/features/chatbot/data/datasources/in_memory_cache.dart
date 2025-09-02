import 'dart:collection';

import '../../../../core/cache/cache_policy.dart';
import '../../../../core/cache/cache_store.dart';
import '../models/message_model.dart';

class InMemoryCache<K, V> implements CacheStore<K, V> {
  final CachePolicy policy;
  final LinkedHashMap<K, V> _store = LinkedHashMap();

  InMemoryCache({required this.policy});

  @override
  Future<void> put(K key, V value) async {
    if (policy.keys.length >= policy.maxItems) {
      // Evict based on policy
      switch (policy.evictionPolicy) {
        case EvictionPolicy.fifo:

          _store.remove(_store.keys.first); // remove oldest
          break;
        case EvictionPolicy.lru:
          _store.remove(
            _store.keys.first,
          ); // basic LRU (needs reordering on access)
          break;
      }
    }
    _store[key] = value;
  }

  @override
  Future<V?> get(K key) async {
    final value = _store[key];
    if (value != null && policy.evictionPolicy == EvictionPolicy.lru) {
      // Move key to end (recently used)
      _store.remove(key);
      _store[key] = value;
    }
    return value;
  }

  @override
  Future<void> remove(K key) async {
    _store.remove(key);
  }

  @override
  Future<List<V>> getAll() async => _store.values.toList();

  @override
  Future<void> clear() async {
    _store.clear();
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
  Future<void> clearMessages(K key) {
    // TODO: implement clearMessages
    throw UnimplementedError();
  }
  
  @override
  Future<void> removeMessage(K key, String messageId) {
    // TODO: implement removeMessage
    throw UnimplementedError();
  }
}
