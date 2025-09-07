import 'package:equatable/equatable.dart';

import 'chat_message.dart';

class OfflineTopicEntity extends Equatable {
  final String topicKey;
  final String englishName;
  final String amharicName;
  final String enDescription;
  final String amDescription;
  final Translations translations;

  const OfflineTopicEntity({
    required this.topicKey,
    required this.englishName,
    required this.amharicName,
    required this.amDescription,
    required this.enDescription,
    required this.translations
  });

  @override
  List<Object?> get props => [topicKey, translations];
}

class Translations extends Equatable{
  final GuideMessage en;
  final GuideMessage amh;

  const Translations({
    required this.en,
    required this.amh
  });

  @override
  List<Object?> get props => [en, amh];
}