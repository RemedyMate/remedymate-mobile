abstract class CacheStore<K, V> {
  Future<void> put(K key, V value);
  Future<V?> get(K key);
  Future<void> remove(K key);
  Future<List<V>> getAll();
  Future<void> clear();
}
