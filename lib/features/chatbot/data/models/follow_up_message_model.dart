part of 'chat_message_model.dart';

class FollowUpMessageModel extends ChatMessageModel {
  final String question;
  final String heading;
  final String subHeading;
  final String followUpId;

  const FollowUpMessageModel({
    required String conversationId,
    required this.question,
    required this.heading,
    required this.subHeading,
    required this.followUpId,
    required DateTime timestamp,
  }) : super(timestamp, conversationId);

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
    'type': 'follow_up', // match what your factory is checking for
    'conversation_id': conversationId,
    'heading': heading,
    'subheading': subHeading,
    'question': {'id': followUpId, 'text': question},
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
