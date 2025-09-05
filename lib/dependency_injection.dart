import 'package:get_it/get_it.dart';

// Data sources
import 'core/api/api_client.dart';
import 'features/chatbot/data/datasources/chat_remote_datasource.dart';

// Repositories
import 'features/chatbot/data/repositories/chat_repository_impl.dart';
import 'features/chatbot/domain/repositories/chat_repository.dart';

// Use cases
import 'features/chatbot/domain/usecases/answer_follow_up.dart';
import 'features/chatbot/domain/usecases/start_chat_usecase.dart';

// Blocs
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';

final sl = GetIt.instance;

void init() {
  // ----------------------
  // External dependencies
  // ----------------------
  // Register your ApiClient here (replace ApiClient() with your actual implementation)
  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  // ----------------------
  // Data sources
  // ----------------------
  sl.registerLazySingleton<ChatRemoteDatasource>(
    () => ChatRemoteDatasourceImpl(apiClient: sl()),
  );

  // ----------------------
  // Repositories
  // ----------------------
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(sl()), // sl() will resolve ChatRemoteDatasource
  );

  // ----------------------
  // Use cases
  // ----------------------
  sl.registerLazySingleton<StartChatUseCase>(
    () => StartChatUseCase(sl()), // sl() will resolve ChatRepository
  );
  sl.registerLazySingleton<AnswerFollowUpUseCase>(
    () => AnswerFollowUpUseCase(sl()), // sl() will resolve ChatRepository
  );

  // ----------------------
  // Blocs
  // ----------------------
  sl.registerFactory<ChatbotBloc>(
    () => ChatbotBloc(startChatUseCase: sl(), answerFollowUpUseCase: sl()),
  );
}
