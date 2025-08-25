/// Defines the behavior when cache reaches max size.
enum EvictionPolicy { fifo, lru }

class CachePolicy {
  final int maxItems;
  final EvictionPolicy evictionPolicy;

  const CachePolicy({
    this.maxItems = 10,
    this.evictionPolicy = EvictionPolicy.fifo,
  });
}
