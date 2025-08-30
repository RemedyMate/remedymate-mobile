import 'dart:collection';

import 'cache_policy.dart';
import 'cache_store.dart';

class InMemoryCache<K, V> implements CacheStore<K, V> {
  final CachePolicy policy;
  final LinkedHashMap<K, V> _store = LinkedHashMap();

  InMemoryCache({required this.policy});

  @override
  Future<void> put(K key, V value) async {
    if (_store.length >= policy.maxItems) {
   
      switch (policy.evictionPolicy) {
        case EvictionPolicy.fifo:
          _store.remove(_store.keys.first); 
          break;
        case EvictionPolicy.lru:
          _store.remove(
            _store.keys.first,
          ); 
          break;
      }
    }
    _store[key] = value;
  }

  @override
  Future<V?> get(K key) async {
    final value = _store[key];
    if (value != null && policy.evictionPolicy == EvictionPolicy.lru) {
   
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
}
