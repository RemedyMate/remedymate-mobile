import '../../domain/entities/offline_topic_entity.dart';
import 'guide_model.dart';

class OfflineTopicModel extends OfflineTopicEntity {
  const OfflineTopicModel({
    required super.topicKey,
    required super.translations,
  });

  factory OfflineTopicModel.fromJson(Map<String, dynamic> json) {
    return OfflineTopicModel(
      topicKey: json['topicKey'] as String,
      translations: TranslationsModel.fromJson(json['translations']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topicKey': topicKey,
      'translations': (translations as TranslationsModel).toJson(),
    };
  }

  OfflineTopicEntity toEntity() {
    return OfflineTopicEntity(
      topicKey: topicKey,
      translations: translations,
    );
  }
}

class TranslationsModel extends Translations {
  const TranslationsModel({
    required super.en,
    required super.amh,
  });

  factory TranslationsModel.fromJson(Map<String, dynamic> json) {
    return TranslationsModel(
      en: GuideModel.fromJson(json['en']).toEntity(),
      amh: GuideModel.fromJson(json['amh']).toEntity(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': (en as GuideModel).toJson(),
      'amh': (amh as GuideModel).toJson(),
    };
  }

  Translations toEntity() {
    return Translations(
      en: en,
      amh: amh,
    );
  }
}
