part of 'chatbot_bloc.dart';

@immutable
sealed class ChatbotState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatbotInitial extends ChatbotState {}

class ChatbotLoading extends ChatbotState {}

class FollowUpLoaded extends ChatbotState {
  final ChatMessage message;
  FollowUpLoaded(this.message);

  @override
  List<Object?> get props => [message];
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

class LoadedOfflineLibrary extends ChatbotState {
  final ChatMessage guide;

  LoadedOfflineLibrary(this.guide);

  @override
  List<Object?> get props => [guide];
}
