part of 'chat_message_model.dart';

class FollowUpAnswerMessageModel extends ChatMessageModel {
  final String conversationId;
  final String followUpId;
  final String answer;
  final String language;
  final DateTime timestamp;

  const FollowUpAnswerMessageModel({
    required this.language,
    required this.conversationId,
    required this.followUpId,
    required this.answer,
    required this.timestamp,
  });

  @override
  Map<String, dynamic> toJson() => {
    'conversation_id': conversationId,
    'answer': answer,
    'language': language,
  };

  @override
  FollowUpAnswerMessage toEntity() => FollowUpAnswerMessage(
    conversationId: conversationId,
    followUpId: followUpId,
    answer: answer,
    language: language,
    timestamp: timestamp,
  );

  @override
  List<Object?> get props => [followUpId, answer, language, timestamp];
}
