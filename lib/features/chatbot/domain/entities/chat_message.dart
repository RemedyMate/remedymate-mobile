import 'package:equatable/equatable.dart';

part 'follow_up_message.dart';
part 'follow_up_answer_message.dart';
part 'guide_message.dart';

sealed class ChatMessage extends Equatable {
  final DateTime timestamp;

  const ChatMessage(this.timestamp);

  @override
  List<Object?> get props => [timestamp];
}
