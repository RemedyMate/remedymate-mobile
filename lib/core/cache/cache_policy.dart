/// Defines the behavior when cache reaches max size.
enum EvictionPolicy { fifo, lru }

class CachePolicy {
  final int maxItems;
  final EvictionPolicy evictionPolicy;
  final List keys;

  const CachePolicy({required this.maxItems, required this.evictionPolicy, required this.keys});
}
