part of 'chat_message_model.dart';

class GuideMessageModel extends ChatMessageModel {
  final String flag;
  final List<String> selfCare;
  final List<String> otc;
  final List<String> medical;
  final DateTime timestamp;

  const GuideMessageModel({
    required this.flag,
    required this.selfCare,
    required this.otc,
    required this.medical,
    required this.timestamp,
  });

  factory GuideMessageModel.fromJson(Map<String, dynamic> json) {
    final remedy = json['remedy'] as Map<String, dynamic>? ?? {};
    final guidanceCard = remedy['guidance_card'] as Map<String, dynamic>? ?? {};
    final triage = remedy['triage'] as Map<String, dynamic>? ?? {};

    return GuideMessageModel(
      flag: triage['level'] ?? 'UNKNOWN',
      selfCare:
          (guidanceCard['self_care'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      otc:
          (guidanceCard['otc_categories'] as List<dynamic>?)
              ?.map((e) => e['category_name'].toString())
              .toList() ??
          [],
      medical:
          (guidanceCard['seek_care_if'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      timestamp: DateTime.now(), // backend doesn't provide timestamp
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'type': 'guide',
    'flag': flag,
    'selfCare': selfCare,
    'otc': otc,
    'medical': medical,
    'timestamp': timestamp.toIso8601String(),
  };

  @override
  GuideMessage toEntity() => GuideMessage(
    flag: flag,
    selfCare: selfCare,
    otc: otc,
    medical: medical,
    timestamp: timestamp,
  );

  @override
  List<Object?> get props => [flag, selfCare, otc, medical, timestamp];
}
