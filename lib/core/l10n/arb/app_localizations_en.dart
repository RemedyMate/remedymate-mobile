// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'RemedyMate';

  @override
  String get languageSwitch => 'EN ↔ Amh';

  @override
  String get homeTitle => 'Safe, Simple Health Guidance at Home';

  @override
  String get homeSubtitle =>
      'Chat with RemedyMate for self-care tips in Amharic or English.';

  @override
  String get startChat => 'Start Chat';

  @override
  String get offline => 'Offline';

  @override
  String get quickAccessTitle => 'Quick Access';

  @override
  String get exploreTitle => 'Explore';

  @override
  String get popularTopicsTitle => 'Popular Topics';

  @override
  String get localTipsTitle => 'Local Tips';

  @override
  String get quickActionSymptomsTitle => 'Check My Symptoms';

  @override
  String get quickActionSymptomsSubtitle => 'Start chat flow';

  @override
  String get quickActionLibraryTitle => 'Offline Library';

  @override
  String get quickActionLibrarySubtitle => 'Cached topics';

  @override
  String get quickActionSavedTitle => 'Saved Sessions';

  @override
  String get quickActionSavedSubtitle => 'Last 10 chats';

  @override
  String get quickActionEmergencyTitle => 'Emergency Help';

  @override
  String get quickActionEmergencySubtitle => 'Urgent assistance';

  @override
  String get popularTopicCold => 'Cold';

  @override
  String get popularTopicHeadache => 'Headache';

  @override
  String get popularTopicHeartburn => 'Heartburn';

  @override
  String get popularTopicMotionSickness => 'Motion Sickness';

  @override
  String get localTipRemedies => 'Safe home remedies';

  @override
  String get localTipWarnings => 'Important warnings';

  @override
  String get disclaimerText =>
      'RemedyMate gives general info only. Not medical advice.';

  @override
  String get learnMore => 'Learn More';
}
