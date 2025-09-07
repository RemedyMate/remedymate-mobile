part of 'chat_message.dart';

class GuideMessage extends ChatMessage {
  final String flag;
  final List<String> selfCare;
  final List<String> otc;
  final List<String> medical;

  const GuideMessage({
    required String conversationId,
    required this.flag,
    required this.selfCare,
    required this.otc,
    required this.medical,
    required DateTime timestamp,
  }) : super(timestamp, conversationId);

  @override
  List<Object?> get props => [
    conversationId,
    flag,
    selfCare,
    otc,
    medical,
    timestamp,
  ];
}
