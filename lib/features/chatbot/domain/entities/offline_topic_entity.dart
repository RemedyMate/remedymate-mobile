import 'package:equatable/equatable.dart';

import 'guide_entity.dart';

class OfflineTopicEntity extends Equatable {
  final String topicKey;
  final Translations translations;

  const OfflineTopicEntity({
    required this.topicKey,
    required this.translations
  });

  @override
  List<Object?> get props => [topicKey, translations];
}

class Translations extends Equatable{
  final GuideEntity en;
  final GuideEntity amh;

  const Translations({
    required this.en,
    required this.amh
  });

  @override
  List<Object?> get props => [en, amh];
}