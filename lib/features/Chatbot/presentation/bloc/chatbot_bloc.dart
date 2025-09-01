import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
    on<AnswerFollowUpEvent>(_onAnswerFollowUp);
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
      LoadChatSessions event, Emitter<ChatbotState> emit) async {
    emit(ChatSessionLoading());

    await Future.delayed(const Duration(seconds: 1));

    const sessions = [
      ChatSession(
        id: '1',
        title: 'Chest Pain Assessment',
        status: 'High',
        statusColor: Colors.red,
      ),
      ChatSession(
        id: '2',
        title: 'Headache Evaluation',
        status: 'Open',
        statusColor: Colors.green,
      ),
      ChatSession(
        id: '3',
        title: 'Medication Side Effects',
        status: 'Low',
        statusColor: Colors.blue,
      ),
      ChatSession(
        id: '4',
        title: 'Digestive Issues',
        status: 'Low',
        statusColor: Colors.green,
      ),
    ];

    emit(ChatSessionLoaded(sessions));
  }

  void _onAnswerFollowUp(AnswerFollowUpEvent event, Emitter<ChatbotState> emit) {
    // Handle the follow-up answer here
    // You can emit appropriate states based on your business logic
    // For example:
    // 1. Emit loading state
    // 2. Process the answer
    // 3. Emit success/failure state
    emit(ChatbotLoading());
    // Process the answer...
    // emit(AnswerProcessed());
  }

}
