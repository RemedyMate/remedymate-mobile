part of 'chat_message_model.dart';

class FollowUpAnswerMessageModel extends ChatMessageModel {
  final String followUpId;
  final String answer;
  final String language;

  const FollowUpAnswerMessageModel({
    required this.language,
    required String conversationId,
    required this.followUpId,
    required this.answer,
    required DateTime timestamp,
  }) : super(timestamp, conversationId);

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
