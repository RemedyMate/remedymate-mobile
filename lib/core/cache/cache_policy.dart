enum EvictionPolicy { fifo, lru }

class CachePolicy<K> {
  final int maxItems;
  final EvictionPolicy evictionPolicy;
  final List<K> keys;

  CachePolicy({
    required this.maxItems,
    required this.evictionPolicy,
    List<K>? keys,
  }) : keys = keys ?? [];
}
