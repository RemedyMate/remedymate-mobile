import 'package:flutter/material.dart';

class ChatSession {
  final String id;
  final String title;
  final String status;
  final Color statusColor;

  const ChatSession({
    required this.id,
    required this.title,
    required this.status,
    required this.statusColor,
  });
}
