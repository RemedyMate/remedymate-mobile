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

  /// No description provided for @aiChatSessions.
  ///
  /// In en, this message translates to:
  /// **'AI Chat Sessions'**
  String get aiChatSessions;

  /// No description provided for @chatHistory.
  ///
  /// In en, this message translates to:
  /// **'Chat History'**
  String get chatHistory;

  /// No description provided for @enAmToggle.
  ///
  /// In en, this message translates to:
  /// **'EN ↔ AM'**
  String get enAmToggle;

  /// No description provided for @symptomChecker.
  ///
  /// In en, this message translates to:
  /// **'Symptom Checker'**
  String get symptomChecker;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Hello! I\'m RemedyMate. I can help you understand your symptoms and provide safe self-care guidance. What symptoms are you experiencing today?'**
  String get welcomeMessage;

  /// No description provided for @quickChipToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get quickChipToday;

  /// No description provided for @quickChipYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get quickChipYesterday;

  /// No description provided for @quickChipOneWeek.
  ///
  /// In en, this message translates to:
  /// **'1 Week'**
  String get quickChipOneWeek;

  /// No description provided for @quickChipSeverePain.
  ///
  /// In en, this message translates to:
  /// **'Severe pain'**
  String get quickChipSeverePain;

  /// No description provided for @typeYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Type your message...'**
  String get typeYourMessage;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'SEND'**
  String get send;

  /// No description provided for @offlineMessage.
  ///
  /// In en, this message translates to:
  /// **'Offline — using limited guidance'**
  String get offlineMessage;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @selfCareSteps.
  ///
  /// In en, this message translates to:
  /// **'✔ Self-Care Steps'**
  String get selfCareSteps;

  /// No description provided for @otcReliefOptions.
  ///
  /// In en, this message translates to:
  /// **'💊 OTC Relief Options'**
  String get otcReliefOptions;

  /// No description provided for @seekMedicalCareIf.
  ///
  /// In en, this message translates to:
  /// **'🚨 Seek Medical Care If'**
  String get seekMedicalCareIf;

  /// No description provided for @flagRed.
  ///
  /// In en, this message translates to:
  /// **'Critical — Seek immediate medical attention'**
  String get flagRed;

  /// No description provided for @flagYellow.
  ///
  /// In en, this message translates to:
  /// **'Monitor closely\nWatch for worsening symptoms'**
  String get flagYellow;

  /// No description provided for @flagGreen.
  ///
  /// In en, this message translates to:
  /// **'Mild symptoms — Safe to self-manage'**
  String get flagGreen;

  /// No description provided for @flagGeneral.
  ///
  /// In en, this message translates to:
  /// **'General guidance'**
  String get flagGeneral;

  /// No description provided for @emergencyNumbers.
  ///
  /// In en, this message translates to:
  /// **'Emergency Numbers'**
  String get emergencyNumbers;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @emergencyServices.
  ///
  /// In en, this message translates to:
  /// **'Emergency Services'**
  String get emergencyServices;

  /// No description provided for @poisonControl.
  ///
  /// In en, this message translates to:
  /// **'Poison Control'**
  String get poisonControl;

  /// No description provided for @mentalHealthCrisis.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Crisis'**
  String get mentalHealthCrisis;

  /// No description provided for @importantSafetyInfo.
  ///
  /// In en, this message translates to:
  /// **'Important Safety Information'**
  String get importantSafetyInfo;
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
