import 'package:equatable/equatable.dart';

import '../../domain/entities/chat_message.dart';
part 'follow_up_answer_message_model.dart';
part 'follow_up_message_model.dart';
part 'guide_message_model.dart';

sealed class ChatMessageModel extends Equatable {
  const ChatMessageModel();

  /// Convert to domain entity
  ChatMessage toEntity();

  /// Factory for decoding from JSON
  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    print("Decoding ChatMessageModel from JSON: $json");
    if (json.containsKey('question')) {
      print("Detected FollowUpMessage structure");
      return FollowUpMessageModel.fromJson(json);
    }

    if (json.containsKey('remedy') &&
        json['remedy'] is Map<String, dynamic> &&
        (json['remedy']['guidance_card'] != null)) {
      return GuideMessageModel.fromJson(json);
    }

    throw Exception('Unknown message structure: $json');
  }

  Map<String, dynamic> toJson();
}
