import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('en'),
  ];

  /// Label for the settings section
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Label for a guest user
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get guestUser;

  /// Label for an anonymous session
  ///
  /// In en, this message translates to:
  /// **'Anonymous Session'**
  String get anonymousSession;

  /// Label for editing user profile
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Header for the account section
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Label for managing user profile
  ///
  /// In en, this message translates to:
  /// **'Manage Profile'**
  String get manageProfile;

  /// Subtitle for managing user profile
  ///
  /// In en, this message translates to:
  /// **'Update your information'**
  String get manageProfileSubtitle;

  /// Label for saved chat sessions
  ///
  /// In en, this message translates to:
  /// **'Saved Sessions'**
  String get savedSessions;

  /// Subtitle for saved chat sessions
  ///
  /// In en, this message translates to:
  /// **'View chat history'**
  String get savedSessionsSubtitle;

  /// Label for notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Subtitle for notifications management
  ///
  /// In en, this message translates to:
  /// **'Manage alerts'**
  String get notificationsSubtitle;

  /// Header for the preferences section
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// Label for language selection
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Subtitle for language selection, showing current languages
  ///
  /// In en, this message translates to:
  /// **'English ↔ Amharic'**
  String get languageSubtitle;

  /// Label for text size adjustment
  ///
  /// In en, this message translates to:
  /// **'Text Size'**
  String get textSize;

  /// Subtitle for text size adjustment
  ///
  /// In en, this message translates to:
  /// **'Adjust readability'**
  String get textSizeSubtitle;

  /// Label for offline mode setting
  ///
  /// In en, this message translates to:
  /// **'Offline Mode'**
  String get offlineMode;

  /// Subtitle for offline mode, explaining its function
  ///
  /// In en, this message translates to:
  /// **'Cache content locally'**
  String get offlineModeSubtitle;

  /// Header for the support section
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// Label for FAQ and Help Center
  ///
  /// In en, this message translates to:
  /// **'FAQ & Help Center'**
  String get faq;

  /// Subtitle for FAQ, indicating common questions
  ///
  /// In en, this message translates to:
  /// **'Common questions'**
  String get faqSubtitle;

  /// Label for contacting support
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// Subtitle for contacting support
  ///
  /// In en, this message translates to:
  /// **'Get help from our team'**
  String get contactSupportSubtitle;

  /// Label for emergency help
  ///
  /// In en, this message translates to:
  /// **'Emergency Help'**
  String get emergencyHelp;

  /// Subtitle for emergency help
  ///
  /// In en, this message translates to:
  /// **'Urgent assistance'**
  String get emergencyHelpSubtitle;

  /// Header for the about section
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Label for terms and privacy policy
  ///
  /// In en, this message translates to:
  /// **'Terms & Privacy Policy'**
  String get terms;

  /// Subtitle for terms and privacy policy
  ///
  /// In en, this message translates to:
  /// **'Legal information'**
  String get termsSubtitle;

  /// Label for version information
  ///
  /// In en, this message translates to:
  /// **'Version Info'**
  String get versionInfo;

  /// Subtitle for version information, showing app version
  ///
  /// In en, this message translates to:
  /// **'RemedyMate v2.1.0'**
  String get versionInfoSubtitle;

  /// Label for signing out
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'RemedyMate'**
  String get appName;

  /// Text for language switch button, indicating English and Amharic
  ///
  /// In en, this message translates to:
  /// **'EN ↔ Amh'**
  String get languageSwitch;

  /// Title displayed on the home screen
  ///
  /// In en, this message translates to:
  /// **'Safe, Simple Health Guidance at Home'**
  String get homeTitle;

  /// Subtitle displayed on the home screen
  ///
  /// In en, this message translates to:
  /// **'Chat with RemedyMate for self-care tips in Amharic or English.'**
  String get homeSubtitle;

  /// Button label to start a chat
  ///
  /// In en, this message translates to:
  /// **'Start Chat'**
  String get startChat;

  /// Status indicator for offline mode
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// Title for the quick access section
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get quickAccessTitle;

  /// Title for the explore section
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get exploreTitle;

  /// Title for the popular topics section
  ///
  /// In en, this message translates to:
  /// **'Popular Topics'**
  String get popularTopicsTitle;

  /// Title for the local tips section
  ///
  /// In en, this message translates to:
  /// **'Local Tips'**
  String get localTipsTitle;

  /// Title for the 'Check My Symptoms' quick action
  ///
  /// In en, this message translates to:
  /// **'Check My Symptoms'**
  String get quickActionSymptomsTitle;

  /// Subtitle for the 'Check My Symptoms' quick action
  ///
  /// In en, this message translates to:
  /// **'Start chat flow'**
  String get quickActionSymptomsSubtitle;

  /// Title for the 'Offline Library' quick action
  ///
  /// In en, this message translates to:
  /// **'Offline Library'**
  String get quickActionLibraryTitle;

  /// Subtitle for the 'Offline Library' quick action
  ///
  /// In en, this message translates to:
  /// **'Cached topics'**
  String get quickActionLibrarySubtitle;

  /// Title for the 'Saved Sessions' quick action
  ///
  /// In en, this message translates to:
  /// **'Saved Sessions'**
  String get quickActionSavedTitle;

  /// Subtitle for the 'Saved Sessions' quick action
  ///
  /// In en, this message translates to:
  /// **'Last 10 chats'**
  String get quickActionSavedSubtitle;

  /// Title for the 'Emergency Help' quick action
  ///
  /// In en, this message translates to:
  /// **'Emergency Help'**
  String get quickActionEmergencyTitle;

  /// Subtitle for the 'Emergency Help' quick action
  ///
  /// In en, this message translates to:
  /// **'Urgent assistance'**
  String get quickActionEmergencySubtitle;

  /// Popular topic: Cold
  ///
  /// In en, this message translates to:
  /// **'Cold'**
  String get popularTopicCold;

  /// Popular topic: Headache
  ///
  /// In en, this message translates to:
  /// **'Headache'**
  String get popularTopicHeadache;

  /// Popular topic: Heartburn
  ///
  /// In en, this message translates to:
  /// **'Heartburn'**
  String get popularTopicHeartburn;

  /// Popular topic: Motion Sickness
  ///
  /// In en, this message translates to:
  /// **'Motion Sicknes'**
  String get popularTopicMotionSickness;

  /// Local tip: Safe home remedies
  ///
  /// In en, this message translates to:
  /// **'Safe home remedies'**
  String get localTipRemedies;

  /// Local tip: Important warnings
  ///
  /// In en, this message translates to:
  /// **'Important warnings'**
  String get localTipWarnings;

  /// Disclaimer text regarding medical advice
  ///
  /// In en, this message translates to:
  /// **'RemedyMate gives general info only. Not medical advice.'**
  String get disclaimerText;

  /// Button label to learn more
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// Status indicator for online mode
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// Title for the important safety information section
  ///
  /// In en, this message translates to:
  /// **'Important Safety Information'**
  String get safetyInfoTitle;

  /// First point in the safety information section
  ///
  /// In en, this message translates to:
  /// **'RemedyMate is an AI-powered health information tool designed to provide general guidance only.'**
  String get safetyInfoPoint1;

  /// Second point in the safety information section
  ///
  /// In en, this message translates to:
  /// **'This app does NOT replace professional medical advice, diagnosis, or treatment.'**
  String get safetyInfoPoint2;

  /// Third point in the safety information section
  ///
  /// In en, this message translates to:
  /// **'Always consult with qualified healthcare providers for medical concerns.'**
  String get safetyInfoPoint3;

  /// Fourth point in the safety information section
  ///
  /// In en, this message translates to:
  /// **'In emergencies, call local emergency services immediately.'**
  String get safetyInfoPoint4;

  /// Button label to acknowledge safety information
  ///
  /// In en, this message translates to:
  /// **'I Understand'**
  String get safetyInfoAction;

  /// Title for the emergency numbers section
  ///
  /// In en, this message translates to:
  /// **'Emergency Numbers'**
  String get emergencyTitle;

  /// Label for emergency services
  ///
  /// In en, this message translates to:
  /// **'Emergency Services'**
  String get emergencyServices;

  /// Label for poison control
  ///
  /// In en, this message translates to:
  /// **'Poison Control'**
  String get poisonControl;

  /// Label for mental health crisis
  ///
  /// In en, this message translates to:
  /// **'Mental Health Crisis'**
  String get mentalHealthCrisis;

  /// Button label to initiate a call
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callAction;

  /// Button label to close a dialog or screen
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeAction;

  /// Title for the symptom checker section
  ///
  /// In en, this message translates to:
  /// **'Symptom Checker'**
  String get symptomCheckerTitle;

  /// Greeting message shown at the start of the symptom checker
  ///
  /// In en, this message translates to:
  /// **'Hello! I’m RemedyMate. I can help you understand your symptoms and provide safe self-care guidance. What symptoms are you experiencing today?'**
  String get symptomCheckerGreeting;

  /// Hint text for the symptom description input field
  ///
  /// In en, this message translates to:
  /// **'Describe your symptoms...'**
  String get symptomCheckerHint;

  /// Label for today's date
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Label for yesterday's date
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// Label for a one week time period
  ///
  /// In en, this message translates to:
  /// **'1 Week'**
  String get oneWeek;

  /// Label for severe pain symptom
  ///
  /// In en, this message translates to:
  /// **'Severe pain'**
  String get severePain;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['am', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
