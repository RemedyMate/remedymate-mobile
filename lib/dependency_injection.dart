import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Core
import 'core/api/api_client.dart';
import 'core/cache/cache_policy.dart';
import 'core/cache/cache_store.dart';
// Data sources
import 'features/chatbot/data/datasources/chat_local_datasource.dart';
import 'features/chatbot/data/datasources/chat_local_datasource_impl.dart';
import 'features/chatbot/data/datasources/chat_remote_datasource.dart';
import 'features/chatbot/data/models/chat_message_model.dart';
// Repositories
import 'features/chatbot/data/repositories/chat_repository_impl.dart';
import 'features/chatbot/domain/repositories/chat_repository.dart';
// Use cases
import 'features/chatbot/domain/usecases/answer_follow_up.dart';
import 'features/chatbot/domain/usecases/clear_session.dart';
import 'features/chatbot/domain/usecases/get_all_conversation.dart';
import 'features/chatbot/domain/usecases/get_conversation.dart';
import 'features/chatbot/domain/usecases/start_chat_usecase.dart';
// Blocs
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ----------------------
  // External dependencies
  // ----------------------
  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  // Hive initialization should be done in main()
  // await Hive.initFlutter(); // do this before calling init()

  // Open a Hive box for chat sessions
  final chatBox = await Hive.openBox('chat_sessions');

  // Register CacheStore (Hive-backed)
  sl.registerLazySingleton<CacheStore<String, List<ChatMessageModel>>>(
    () => HiveCacheStore<String>(
      chatBox,
      CachePolicy(maxItems: 20, evictionPolicy: EvictionPolicy.lru),
    ),
  );

  // ----------------------
  // Data sources
  // ----------------------
  sl.registerLazySingleton<ChatRemoteDatasource>(
    () => ChatRemoteDatasourceImpl(apiClient: sl()),
  );

  sl.registerLazySingleton<ChatLocalDatasource>(
    () => ChatLocalDatasource(sl()), // inject CacheStore
  );

  // ----------------------
  // Repositories
  // ----------------------
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(sl(), sl()),
    // needs ChatRemoteDatasource + ChatLocalDatasource
  );

  // ----------------------
  // Use cases
  // ----------------------
  sl.registerLazySingleton<StartChatUseCase>(() => StartChatUseCase(sl()));

  sl.registerLazySingleton<AnswerFollowUpUseCase>(
    () => AnswerFollowUpUseCase(sl()),
  );
  sl.registerLazySingleton<GetAllConversations>(
    () => GetAllConversations(sl()),
  );
  sl.registerLazySingleton<GetConversation>(() => GetConversation(sl()));
  sl.registerLazySingleton<ClearSession>(() => ClearSession(sl()));

  // ----------------------
  // Blocs
  // ----------------------
  sl.registerFactory<ChatbotBloc>(
    () => ChatbotBloc(
      startChatUseCase: sl(),
      answerFollowUpUseCase: sl(),
      getAllConversations: sl(),
      getConversation: sl(),
      clearSession: sl(),
    ),
  );
}
