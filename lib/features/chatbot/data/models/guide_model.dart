import '../../domain/entities/guide_entity.dart';

class GuideModel extends GuideEntity {
  const GuideModel({
    required super.flag,
    required super.selfCare,
    required super.otc,
    required super.medical,
  });

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
