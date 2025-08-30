import '../../domain/entities/guide_entity.dart';

class GuideModel extends GuideEntity {
  const GuideModel({
    required String flag,
    required List<String> selfCare,
    required List<String> otc,
    required List<String> medical,
  }) : super(
          flag: flag,
          selfCare: selfCare,
          otc: otc,
          medical: medical,
        );

  factory GuideModel.fromJson(Map<String, dynamic> json) {
    return GuideModel(
      flag: json['flag'] as String,
      selfCare: List<String>.from(json['safe-care']),
      otc: List<String>.from(json['otc']),
      medical: List<String>.from(json['medical']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flag': flag,
      'safe-care': selfCare,
      'otc': otc,
      'medical': medical,
    };
  }

  GuideEntity toEntity() {
    return GuideEntity(
      flag: flag,
      selfCare: selfCare,
      otc: otc,
      medical: medical,
    );
  }
}
