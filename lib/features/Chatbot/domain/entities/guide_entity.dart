import 'package:equatable/equatable.dart';

class GuideEntity extends Equatable {
  final String flag;
  final List<String> selfCare;
  final List<String> otc;
  final List<String> medical;

  const GuideEntity({
    required this.flag,
    required this.selfCare,
    required this.otc,
    required this.medical,
  });

  @override
  List<Object?> get props => [flag, selfCare, otc, medical];
}

class FollowUpMessage {
  final String conversationId;
  final String question;

  FollowUpMessage({
    required this.conversationId,
    required this.question,
  });
}
