class MessageModel {
  final String id;
  final String content;
  final DateTime timeStamp;

  MessageModel({
    required this.id,
    required this.content,
    required this.timeStamp,
  });

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'timestamp': timeStamp.toIso8601String(),
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      content: json['content'],
      timeStamp: DateTime.parse(json['timestamp']),
    );
  }
}
