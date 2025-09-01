part of 'chatbot_bloc.dart';

@immutable
sealed class ChatbotState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatbotInitial extends ChatbotState {}

class ChatbotLoading extends ChatbotState {}

class GuideLoaded extends ChatbotState {
  final GuideEntity guideEntity;
  GuideLoaded(this.guideEntity);

  @override
  List<Object?> get props => [guideEntity];
}

class FollowUpLoaded extends ChatbotState {
  final String conversationId;
  final String question;
  FollowUpLoaded(this.question, this.conversationId);

  @override
  List<Object?> get props => [question];
}

class ChatbotError extends ChatbotState {
  final String message;
  ChatbotError(this.message);

  @override
  List<Object?> get props => [message];
}

class ChatSessionLoading extends ChatbotState {}

class ChatSessionLoaded extends ChatbotState {
  final List<ChatSession> sessions;
  ChatSessionLoaded(this.sessions);
  
  @override
  List<Object?> get props => [sessions];
}
