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
  final String language;
  final String followUpId;
  AnswerFollowUpEvent({
    required this.conversationId,
    required this.answer,
    required this.language,
    required this.followUpId,
  });
}

class LoadChatSessions extends ChatbotEvent {}

class LoadHomePageData extends ChatbotEvent {}

class LoadConversation extends ChatbotEvent {
  final String sessionId;
  LoadConversation(this.sessionId);
}

class ClearAllSessionEvent extends ChatbotEvent {
  ClearAllSessionEvent();
}
class LoadOfflineEvent extends ChatbotEvent {}
