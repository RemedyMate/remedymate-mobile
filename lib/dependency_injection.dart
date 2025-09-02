import 'package:get_it/get_it.dart';

import 'features/chatbot/data/datasources/mock_datasources.dart';
import 'features/chatbot/data/repositories/guide_repo_impl.dart';
import 'features/chatbot/domain/repositories/guide_repo.dart';
import 'features/chatbot/domain/usecases/start_chat_usecase.dart';
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<GuideDataSource>(() => MockGuideDataSource());
  sl.registerLazySingleton<GuideRepository>(() => GuideRepositoryImpl(sl()));
  sl.registerLazySingleton<StartChatUseCase>(() => StartChatUseCase(sl()));
  sl.registerFactory<ChatbotBloc>(() => ChatbotBloc(startChatUseCase: sl()));
}
