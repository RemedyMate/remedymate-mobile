import 'package:get_it/get_it.dart';

import 'features/Chatbot/data/datasources/mock_datasources.dart';
import 'features/Chatbot/data/repositories/guide_repo_impl.dart';
import 'features/Chatbot/domain/repositories/guide_repo.dart';
import 'features/Chatbot/domain/usecases/start_chat_usecase.dart';
import 'features/Chatbot/presentation/bloc/chatbot_bloc.dart';

final sl = GetIt.instance;

void init(){
  sl.registerLazySingleton<GuideDataSource>(() => MockGuideDataSource());
  sl.registerLazySingleton<GuideRepository>(() => GuideRepositoryImpl(sl()));
  sl.registerLazySingleton<StartChatUseCase>(() => StartChatUseCase(sl()));
  sl.registerFactory<ChatbotBloc>(() => ChatbotBloc(startChatUseCase: sl()));

}