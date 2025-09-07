part of 'chat_message_model.dart';

class GuideMessageModel extends ChatMessageModel {
  final String flag;
  final List<String> selfCare;
  final List<String> otc;
  final List<String> medical;

  const GuideMessageModel({
    required String conversationId,
    required this.flag,
    required this.selfCare,
    required this.otc,
    required this.medical,
    required DateTime timestamp,
  }) : super(timestamp, conversationId);

  factory GuideMessageModel.fromJson(Map<String, dynamic> json) {
    final remedy = json['remedy'] != null
        ? Map<String, dynamic>.from(json['remedy'] as Map)
        : <String, dynamic>{};

    final guidanceCard = remedy['guidance_card'] != null
        ? Map<String, dynamic>.from(remedy['guidance_card'] as Map)
        : <String, dynamic>{};

    final triage = remedy['triage'] != null
        ? Map<String, dynamic>.from(remedy['triage'] as Map)
        : <String, dynamic>{};

    return GuideMessageModel(
      conversationId: json['conversation_id'] ?? 'unknown',
      flag: triage['level'] ?? 'UNKNOWN',
      selfCare:
          (guidanceCard['self_care'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      otc:
          (guidanceCard['otc_categories'] as List<dynamic>?)
              ?.map((e) => (e as Map)['category_name'].toString())
              .toList() ??
          [],
      medical:
          (guidanceCard['seek_care_if'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      timestamp: DateTime.now(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'conversation_id': conversationId,
    'type': 'guide',
    'remedy': {
      'triage': {'level': flag},
      'guidance_card': {
        'self_care': selfCare,
        'otc_categories': otc
            .map((category) => {'category_name': category})
            .toList(),
        'seek_care_if': medical,
      },
    },
    'timestamp': timestamp.toIso8601String(),
  };

  @override
  GuideMessage toEntity() => GuideMessage(
    conversationId: conversationId,
    flag: flag,
    selfCare: selfCare,
    otc: otc,
    medical: medical,
    timestamp: timestamp,
  );

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
