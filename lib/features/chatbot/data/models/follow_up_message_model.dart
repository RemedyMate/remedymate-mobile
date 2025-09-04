part of 'chat_message_model.dart';

class FollowUpMessageModel extends ChatMessageModel {
  final String conversationId;
  final String question;
  final String heading;
  final String subHeading;
  final String followUpId;
  final DateTime timestamp;

  const FollowUpMessageModel({
    required this.conversationId,
    required this.question,
    required this.heading,
    required this.subHeading,
    required this.followUpId,
    required this.timestamp,
  });

  factory FollowUpMessageModel.fromJson(Map<String, dynamic> json) {
    return FollowUpMessageModel(
      conversationId: json['conversation_id'],
      question: json['question']['text'],
      heading: json['heading'],
      subHeading: json['subheading'],
      followUpId: json['question']['id'].toString(),
      timestamp: DateTime.now(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'type': 'followUp',
    'conversationId': conversationId,
    'question': question,
    'heading': heading,
    'subHeading': subHeading,
    'followUpId': followUpId,
    'timestamp': timestamp.toIso8601String(),
  };

  @override
  FollowUpMessage toEntity() => FollowUpMessage(
    conversationId: conversationId,
    question: question,
    heading: heading,
    subHeading: subHeading,
    followUpId: followUpId,
    timestamp: timestamp,
  );

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
