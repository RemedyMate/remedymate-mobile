import 'package:hive_flutter/hive_flutter.dart';

part 'message_model.g.dart'; // Hive will generate this adapter

@HiveType(typeId: 0) // unique ID for this model
class MessageModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final bool isUser;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final DateTime timeStamp;



  MessageModel({
    required this.id,
    required this.isUser,
    required this.content,
    required this.timeStamp,
  });

  // JSON serialization (optional, still works)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isUser':isUser,
      'content': content,
      'timestamp': timeStamp.toIso8601String(),
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      isUser: json['isUser'],
      content: json['content'],
      timeStamp: DateTime.parse(json['timestamp']),
    );
  }
}
