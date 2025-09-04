part of 'chat_message.dart';

class FollowUpMessage extends ChatMessage {
  final String conversationId;
  final String question;
  final String heading;
  final String subHeading;
  final String followUpId;

  const FollowUpMessage({
    required this.conversationId,
    required this.question,
    required this.heading,
    required this.subHeading,
    required this.followUpId,
    required DateTime timestamp,
  }) : super(timestamp);

  @override
  List<Object?> get props => [
    conversationId,
    question,
    heading,
    subHeading,
    followUpId,
    timestamp,
  ];
}
