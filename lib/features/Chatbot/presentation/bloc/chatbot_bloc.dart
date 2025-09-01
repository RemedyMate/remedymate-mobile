import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/chat_session_entity.dart';
import '../../domain/entities/guide_entity.dart';
import '../../domain/usecases/start_chat_usecase.dart';

part 'chatbot_event.dart';
part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  final StartChatUseCase startChatUseCase;

  ChatbotBloc({required this.startChatUseCase}) : super(ChatbotInitial()) {
    on<StartChatEvent>(_onGetGuidanceCard);
    on<LoadChatSessions>(_onLoadChatSessions);
  }

  Future<void> _onGetGuidanceCard(
      StartChatEvent event, Emitter<ChatbotState> emit) async {
    emit(ChatbotLoading());

    final result = await startChatUseCase(event.symptoms, event.language);

    result.fold(
      (failure) => emit(ChatbotError(failure.message)),
      (guide) =>
        guide.fold(
          (guideEntity) => emit(GuideLoaded(guideEntity)),
          (followUpMessage) => emit(FollowUpLoaded(followUpMessage.question, followUpMessage.conversationId)),
        )
    );
  }

  Future<void> _onLoadChatSessions(
      ChatbotEvent event, Emitter<ChatbotState> emit) async {
    emit(ChatSessionLoading());

    await Future.delayed(const Duration(seconds: 1));

    const sessions = [
      ChatSession(
        id: '1',
        title: 'Chest Pain Assessment',
        status: 'High',
        statusColor: AppColors.redTriage,
        timeStamp: '2024-10-01 10:00 AM',
      ),
      ChatSession(
        id: '1',
        title: 'Headache Evaluation',
        status: 'Open',
        statusColor: AppColors.greenTriage,
        timeStamp: '2024-10-02 02:30 PM',
      ),
      ChatSession(
        id: '3',
        title: 'Medication Side Effects',
        status: 'Low',
        statusColor: AppColors.amberTriage,
        timeStamp: '2024-10-03 11:15 AM',
      ),
      ChatSession(
        id: '4',
        title: 'Digestive Issues',
        status: 'Low',
        statusColor: AppColors.greenTriage,
        timeStamp: '2024-10-04 09:45 AM',
      ),
    ];

    emit(ChatSessionLoaded(sessions));
  }


}
