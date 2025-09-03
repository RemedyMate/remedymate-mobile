part of 'chatbot_bloc.dart';

@immutable
sealed class ChatbotEvent {}

class StartChatEvent extends ChatbotEvent {
  final String symptoms;
  final String language;
  StartChatEvent(this.symptoms, this.language);
}

class AnswerFollowUpEvent extends ChatbotEvent {
  final String conversationId;
  final String answer;
  AnswerFollowUpEvent(this.conversationId, this.answer);
}

class LoadChatSessions extends ChatbotEvent {}