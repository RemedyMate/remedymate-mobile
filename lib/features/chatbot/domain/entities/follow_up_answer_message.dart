part of 'chat_message.dart';

class FollowUpAnswerMessage extends ChatMessage {
  final String followUpId;
  final String answer;
  final String language;

  const FollowUpAnswerMessage({
    required String conversationId,
    required this.followUpId,
    required this.answer,
    required this.language,
    required DateTime timestamp,
  }) : super(timestamp, conversationId);

  @override
  List<Object?> get props => [
    conversationId,
    followUpId,
    answer,
    language,
    timestamp,
  ];
}
