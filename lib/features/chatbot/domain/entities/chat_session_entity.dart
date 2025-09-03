import 'package:flutter/material.dart';

import 'message_entity.dart';

class ChatSession {
  final String id;
  final String title;
  final String status;
  final Color statusColor;
  final String timeStamp;
  final bool isCompleted;
  final List<MessageEntity> messages;

  const ChatSession({
    required this.id,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.timeStamp,
    this.isCompleted = false,
    required this.messages,
  });
}
