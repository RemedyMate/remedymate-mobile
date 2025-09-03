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

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

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
