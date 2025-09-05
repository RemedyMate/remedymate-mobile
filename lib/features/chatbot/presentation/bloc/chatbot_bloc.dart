import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_session_entity.dart';
import '../../domain/usecases/answer_follow_up.dart';
import '../../domain/usecases/start_chat_usecase.dart';

part 'chatbot_event.dart';
part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  final StartChatUseCase startChatUseCase;
  final AnswerFollowUpUseCase answerFollowUpUseCase;

  ChatbotBloc({
    required this.startChatUseCase,
    required this.answerFollowUpUseCase,
  }) : super(ChatbotInitial()) {
    on<StartChatEvent>(_onStartChatEvent);
    on<AnswerFollowUpEvent>(_onAnswerFollowUpEvent);
  }

  Future<void> _onStartChatEvent(
    StartChatEvent event,
    Emitter<ChatbotState> emit,
  ) async {
    emit(ChatbotLoading());
    final result = await startChatUseCase(event.symptoms, event.language);
    result.fold(
      (failure) => emit(ChatbotError(failure.toString())),
      (message) => emit(FollowUpLoaded(message)),
    );
  }

  Future<void> _onAnswerFollowUpEvent(
    AnswerFollowUpEvent event,
    Emitter<ChatbotState> emit,
  ) async {
    emit(ChatbotLoading());
    // Create FollowUpAnswerMessage entity
    final followUpMessage = FollowUpAnswerMessage(
      conversationId: event.conversationId,
      answer: event.answer,
      language: event.language,
      timestamp: DateTime.now(),
      followUpId: event.followUpId,
    );

    final result = await answerFollowUpUseCase(followUpMessage);
    result.fold(
      (failure) => emit(ChatbotError(failure.toString())),
      (message) => emit(FollowUpLoaded(message)),
    );
  }

  Future<void> _onAnswerFollowup(
    AnswerFollowUpEvent event,
    Emitter<ChatbotState> emit,
  ) async {
    emit(ChatbotLoading());

    final result = await startChatUseCase(event.answer, event.conversationId);

    result.fold(
      (failure) => emit(ChatbotError(failure.message)),
      (guide) => guide.fold(
        (guideEntity) => emit(GuideLoaded(guideEntity)),
        (followUpMessage) => emit(
          FollowUpLoaded(
            followUpMessage.question,
            followUpMessage.conversationId,
          ),
        ),
      ),
    );
  }

}
