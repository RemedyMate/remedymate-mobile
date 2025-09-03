class MessageEntity {
  final String id;
  final bool isUser;
  final String content;
  final DateTime timestamp;

  MessageEntity({
    required this.id,
    required this.isUser,
    required this.content,
    required this.timestamp,
  });
}
