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

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @guestUser.
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get guestUser;

  /// No description provided for @anonymousSession.
  ///
  /// In en, this message translates to:
  /// **'Anonymous Session'**
  String get anonymousSession;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @manageProfile.
  ///
  /// In en, this message translates to:
  /// **'Manage Profile'**
  String get manageProfile;

  /// No description provided for @manageProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Update your information'**
  String get manageProfileSubtitle;

  /// No description provided for @savedSessions.
  ///
  /// In en, this message translates to:
  /// **'Saved Sessions'**
  String get savedSessions;

  /// No description provided for @savedSessionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View chat history'**
  String get savedSessionsSubtitle;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage alerts'**
  String get notificationsSubtitle;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'English ↔ Amharic'**
  String get languageSubtitle;

  /// No description provided for @textSize.
  ///
  /// In en, this message translates to:
  /// **'Text Size'**
  String get textSize;

  /// No description provided for @textSizeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Adjust readability'**
  String get textSizeSubtitle;

  /// No description provided for @offlineMode.
  ///
  /// In en, this message translates to:
  /// **'Offline Mode'**
  String get offlineMode;

  /// No description provided for @offlineModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cache content locally'**
  String get offlineModeSubtitle;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ & Help Center'**
  String get faq;

  /// No description provided for @faqSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Common questions'**
  String get faqSubtitle;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @contactSupportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get help from our team'**
  String get contactSupportSubtitle;

  /// No description provided for @emergencyHelp.
  ///
  /// In en, this message translates to:
  /// **'Emergency Help'**
  String get emergencyHelp;

  /// No description provided for @emergencyHelpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Urgent assistance'**
  String get emergencyHelpSubtitle;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms & Privacy Policy'**
  String get terms;

  /// No description provided for @termsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Legal information'**
  String get termsSubtitle;

  /// No description provided for @versionInfo.
  ///
  /// In en, this message translates to:
  /// **'Version Info'**
  String get versionInfo;

  /// No description provided for @versionInfoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'RemedyMate v2.1.0'**
  String get versionInfoSubtitle;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'RemedyMate'**
  String get appName;

  /// No description provided for @languageSwitch.
  ///
  /// In en, this message translates to:
  /// **'EN ↔ Amh'**
  String get languageSwitch;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Safe, Simple Health Guidance at Home'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Chat with RemedyMate for self-care tips in Amharic or English.'**
  String get homeSubtitle;

  /// No description provided for @startChat.
  ///
  /// In en, this message translates to:
  /// **'Start Chat'**
  String get startChat;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @quickAccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get quickAccessTitle;

  /// No description provided for @exploreTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get exploreTitle;

  /// No description provided for @popularTopicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Popular Topics'**
  String get popularTopicsTitle;

  /// No description provided for @localTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Local Tips'**
  String get localTipsTitle;

  /// No description provided for @quickActionSymptomsTitle.
  ///
  /// In en, this message translates to:
  /// **'Check My Symptoms'**
  String get quickActionSymptomsTitle;

  /// No description provided for @quickActionSymptomsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start chat flow'**
  String get quickActionSymptomsSubtitle;

  /// No description provided for @quickActionLibraryTitle.
  ///
  /// In en, this message translates to:
  /// **'Offline Library'**
  String get quickActionLibraryTitle;

  /// No description provided for @quickActionLibrarySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cached topics'**
  String get quickActionLibrarySubtitle;

  /// No description provided for @quickActionSavedTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Sessions'**
  String get quickActionSavedTitle;

  /// No description provided for @quickActionSavedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Last 10 chats'**
  String get quickActionSavedSubtitle;

  /// No description provided for @quickActionEmergencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency Help'**
  String get quickActionEmergencyTitle;

  /// No description provided for @quickActionEmergencySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Urgent assistance'**
  String get quickActionEmergencySubtitle;

  /// No description provided for @popularTopicCold.
  ///
  /// In en, this message translates to:
  /// **'Cold'**
  String get popularTopicCold;

  /// No description provided for @popularTopicHeadache.
  ///
  /// In en, this message translates to:
  /// **'Headache'**
  String get popularTopicHeadache;

  /// No description provided for @popularTopicHeartburn.
  ///
  /// In en, this message translates to:
  /// **'Heartburn'**
  String get popularTopicHeartburn;

  /// No description provided for @popularTopicMotionSickness.
  ///
  /// In en, this message translates to:
  /// **'Motion Sickness'**
  String get popularTopicMotionSickness;

  /// No description provided for @localTipRemedies.
  ///
  /// In en, this message translates to:
  /// **'Safe home remedies'**
  String get localTipRemedies;

  /// No description provided for @localTipWarnings.
  ///
  /// In en, this message translates to:
  /// **'Important warnings'**
  String get localTipWarnings;

  /// No description provided for @disclaimerText.
  ///
  /// In en, this message translates to:
  /// **'RemedyMate gives general info only. Not medical advice.'**
  String get disclaimerText;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;
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
