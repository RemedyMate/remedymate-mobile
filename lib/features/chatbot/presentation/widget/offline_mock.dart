import '../../domain/entities/chat_message.dart';
import '../../domain/entities/offline_topic_entity.dart';

final mockOfflineTopics = [
  OfflineTopicEntity(
    topicKey: 'indigestion',
    englishName: 'Indigestion',
    amharicName: 'የሆድ ያልተረጋጋ',
    enDescription:
        'Learn how to manage indigestion symptoms and when to seek medical care.',
    amDescription:
        'የሆድ ያልተረጋጋነትን ምልክቶች እንዴት እንደሚያቆጡ እና መቼ የሕክምና እገዛ መፈለግ እንዳለብዎት ይወቁ።',
    translations: Translations(
      en: GuideMessage(
        conversationId: 'indigestion_guide_en',
        flag: 'common',
        selfCare: const [
          'Eat smaller, more frequent meals.',
          'Avoid fatty and spicy foods.',
          'Drink water slowly instead of large gulps.',
        ],
        otc: const [
          'Antacids like Tums or Rolaids.',
          'Acid reducers (H2 blockers) if symptoms persist.',
        ],
        medical: const [
          'If pain is severe or persistent.',
          'If you notice blood in stool or vomit.',
          'If indigestion is accompanied by chest pain.',
        ],
        timestamp: DateTime.now(),
      ),
      amh: GuideMessage(
        conversationId: 'indigestion_guide_amh',
        flag: 'የተለመደ',
        selfCare: const [
          'ትንሽ ትንሽ ምግብ በብዛት ብሉ።',
          'ስብ ያለበትን እና ቅመም ያለበትን ምግብ ይቀንሱ።',
          'በአንፃር ውኃ ይጠጡ።',
        ],
        otc: const [
          'አንታሲድ (Antacid) መድሀኒቶች እንደ Tums ወይም Rolaids።',
          'የአሲድ መቆጣጠሪያ (H2 blocker) መድሀኒቶች።',
        ],
        medical: const [
          'ህመም ከባድ ከሆነ ወይም ረጅም ጊዜ ከቆየ።',
          'በሰገራ ወይም በአስትሮት ውስጥ ደም ከታየ።',
          'የሆድ ያልተረጋጋነት ከየልብ ህመም ጋር ከተከተለ።',
        ],
        timestamp: DateTime.now(),
      ),
    ),
  ),
  OfflineTopicEntity(
    topicKey: 'headache',
    englishName: 'Headache',
    amharicName: 'ራስ ህመም',
    enDescription: 'Understand types of headaches and when to get help.',
    amDescription: 'የራስ ህመም ዓይነቶችን እና መቼ መድሃኒት መፈለግ እንዳለብዎት ይረዱ።',
    translations: Translations(
      en: GuideMessage(
        conversationId: 'headache_guide_en',
        flag: 'common',
        selfCare: const [
          'Rest in a quiet, dark room.',
          'Drink water to stay hydrated.',
          'Use a cold or warm compress on your head or neck.',
        ],
        otc: const [
          'Paracetamol (Acetaminophen).',
          'Ibuprofen (Advil, Motrin).',
        ],
        medical: const [
          'If headaches are frequent and severe.',
          'If accompanied by vision changes, nausea, or weakness.',
          'If sudden and extremely painful (possible emergency).',
        ],
        timestamp: DateTime.now(),
      ),
      amh: GuideMessage(
        conversationId: 'headache_guide_amh',
        flag: 'የተለመደ',
        selfCare: const [
          'በጸጥ እና ጨለማ ያለ ክፍል ውስጥ ዕረፉ።',
          'በቂ ውሃ ይጠጡ።',
          'በራስ ወይም በአንገት ላይ ቀዝቃዛ ወይም ሞቃት ጭብጥ ይጠቀሙ።',
        ],
        otc: const ['ፓራሰታሞል (Paracetamol).', 'አይቡፕሮፈን (Ibuprofen).'],
        medical: const [
          'ራስ ህመም ከባድ ከሆነ ወይም ብዙ ጊዜ ከተከተለ።',
          'ከእይታ ችግር፣ ማቅለሽለሽ ወይም ድካም ጋር ከተከተለ።',
          'በድንገት እጅግ ከባድ ከሆነ (የአስቸኳይ አደጋ ሊሆን ይችላል).',
        ],
        timestamp: DateTime.now(),
      ),
    ),
  ),
];
