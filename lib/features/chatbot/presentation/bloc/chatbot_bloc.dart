import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_session_entity.dart';
import '../../domain/usecases/answer_follow_up.dart';
import '../../domain/usecases/clear_session.dart';
import '../../domain/usecases/get_all_conversation.dart';
import '../../domain/usecases/get_conversation.dart';
import '../../domain/usecases/start_chat_usecase.dart';

part 'chatbot_event.dart';
part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  final StartChatUseCase startChatUseCase;
  final AnswerFollowUpUseCase answerFollowUpUseCase;
  final GetAllConversations getAllConversations;
  final GetConversation getConversation;
  final ClearSession clearSession;

  ChatbotBloc({
    required this.startChatUseCase,
    required this.answerFollowUpUseCase,
    required this.getAllConversations,
    required this.getConversation,
    required this.clearSession,
  }) : super(ChatbotInitial()) {
    on<StartChatEvent>(_onStartChatEvent);
    on<AnswerFollowUpEvent>(_onAnswerFollowUpEvent);
    on<LoadChatSessions>((event, emit) async {
      emit(ChatSessionLoading());
      try {
        final sessionsResult = await getAllConversations();
        sessionsResult.fold((failure) => emit(ChatbotError(failure.toString())), (
          sessions,
        ) {
          final entities = List.generate(sessions.length, (index) {
            return ChatSession(
              id: sessions[index].first.conversationId,
              // if the first messsage is followupandwermessage extract the answer else use session index
              title: sessions[index].first is FollowUpAnswerMessage
                  ? (sessions[index].first as FollowUpAnswerMessage).answer
                  : 'Session ${index + 1}', // Extract from first message
              //check if the list contains GuideMessage and set the status complete and incomplete
              status: sessions[index].any((msg) => msg is GuideMessage)
                  ? 'Completed'
                  : 'Incomplete',
              statusColor: sessions[index].any((msg) => msg is GuideMessage)
                  ? Colors.green
                  : Colors.red,
              timeStamp: 'now',
              messages: sessions[index],
            );
          });
          emit(ChatSessionLoaded(entities));
        });
      } catch (e) {
        emit(ChatbotError(e.toString()));
      }
    });

    on<LoadConversation>((event, emit) async {
      emit(ChatSessionLoading());
      try {
        final messagesResult = await getConversation(event.sessionId);
        messagesResult.fold(
          (failure) => emit(ChatbotError(failure.toString())),
          (messages) => emit(ConversationLoaded(messages)),
        );
      } catch (e) {
        emit(ChatbotError(e.toString()));
      }
    });
    on<ClearAllSessionEvent>((event, emit) async {
      emit(ChatSessionLoading());
      try {
        final result = await clearSession();
        result.fold(
          (failure) => emit(ChatbotError(failure.toString())),
          (_) => emit(ChatbotError('All sessions cleared')),
        );
      } catch (e) {
        emit(ChatbotError(e.toString()));
      }
    });
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
}
