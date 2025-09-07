import 'package:equatable/equatable.dart';

import '../../domain/entities/chat_message.dart';
part 'follow_up_answer_message_model.dart';
part 'follow_up_message_model.dart';
part 'guide_message_model.dart';

sealed class ChatMessageModel extends Equatable {
  final String conversationId;
  final DateTime timestamp;

  const ChatMessageModel(this.timestamp, this.conversationId);

  /// Convert to domain entity
  ChatMessage toEntity();

  /// Factory for decoding from JSON
  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('question')) {
      return FollowUpMessageModel.fromJson(json);
    }
    if (json.containsKey('remedy') &&
        (json['remedy']['guidance_card'] != null)) {
      return GuideMessageModel.fromJson(json);
    }
    return FollowUpAnswerMessageModel(
      language: json['language'],
      conversationId: json['conversation_id'],
      followUpId: '0',
      answer: json['answer'],
      timestamp: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson();
}
