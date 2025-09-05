part of 'chat_message.dart';

class FollowUpAnswerMessage extends ChatMessage {
  final String conversationId;
  final String followUpId;
  final String answer;
  final String language;

  const FollowUpAnswerMessage({
    required this.conversationId,
    required this.followUpId,
    required this.answer,
    required this.language,
    required DateTime timestamp,
  }) : super(timestamp);

  @override
  List<Object?> get props => [
    conversationId,
    followUpId,
    answer,
    language,
    timestamp,
  ];
}
