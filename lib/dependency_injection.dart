import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/cache/cache_policy.dart';
import 'core/cache/cache_store.dart';
import 'features/chatbot/data/datasources/hive_cache_store.dart';
import 'features/chatbot/data/datasources/mock_datasources.dart';
import 'features/chatbot/data/models/message_model.dart';
import 'features/chatbot/data/repositories/guide_repo_impl.dart';
import 'features/chatbot/domain/repositories/guide_repo.dart';
import 'features/chatbot/domain/usecases/start_chat_usecase.dart';
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(MessageModelAdapter());

  final chatBox = await Hive.openBox('chat_cache');

  // Register HiveCacheStore for sessions
  sl.registerSingleton<CacheStore<String, List<MessageModel>>>(
    HiveCacheStore<String, List<MessageModel>>(
      chatBox,
      const CachePolicy(
        maxItems: 10, // max 10 sessions
        evictionPolicy: EvictionPolicy.lru,
        keys: [],
      ),
    ),
  );

  sl.registerLazySingleton<GuideDataSource>(() => MockGuideDataSource());
  sl.registerLazySingleton<GuideRepository>(() => GuideRepositoryImpl(sl()));
  sl.registerLazySingleton<StartChatUseCase>(() => StartChatUseCase(sl()));
  sl.registerFactory<ChatbotBloc>(() => ChatbotBloc(startChatUseCase: sl()));
}
