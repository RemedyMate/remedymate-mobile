import 'package:hive_flutter/hive_flutter.dart';

import 'core/cache/cache_policy.dart';
import 'features/chatbot/data/datasources/hive_cache_store.dart';

HiveCacheStore store = HiveCacheStore(
  Hive.box('chat_cache'),
  const CachePolicy(
    maxItems: 10,
    evictionPolicy: EvictionPolicy.lru,
    keys: [],
  ),
);

