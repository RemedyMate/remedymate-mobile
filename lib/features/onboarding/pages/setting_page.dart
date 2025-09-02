import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/l10n/arb/app_localizations.dart';

import '../widgets/section_card.dart';
import '../widgets/section_tiles.dart';

class SettingPage extends StatefulWidget {
  final void Function(Locale) onLocaleChanged;

  const SettingPage({super.key, required this.onLocaleChanged});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool notificationsOn = true;
  bool offlineModeOn = false;
  String textSize = 'Medium';
  String language = 'EN ↔ Ahm';

  @override
  void initState() {
    super.initState();
    // Assign toggle function to section_tiles
    toggleLanguageFunc = toggleLanguage;
  }

  // Get font size based on textSize
  double getFontSize() {
    switch (textSize) {
      case 'Small':
        return 12;
      case 'Medium':
        return 16;
      case 'Large':
        return 20;
      default:
        return 16;
    }
  }

  // Toggle language
  void toggleLanguage() {
    setState(() {
      if (language == 'EN ↔ Ahm') {
        language = 'Ahm ↔ EN';
        widget.onLocaleChanged(const Locale('am'));
      } else {
        language = 'EN ↔ Ahm';
        widget.onLocaleChanged(const Locale('en'));
      }
    });
    debugPrint('Language toggled: $language');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getFontSize(),
          ),
        ),
        centerTitle: false,
        backgroundColor: AppColors.appBarColor,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: toggleLanguage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                language,
                style: TextStyle(fontSize: getFontSize() - 2),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAccountSection(context),
          const SizedBox(height: 24),
          _buildPreferencesSection(context),
          const SizedBox(height: 24),
          _buildSupportSection(context),
          const SizedBox(height: 24),
          _buildAboutSection(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  SectionCard _buildAccountSection(BuildContext context) {
    return SectionCard(
      title: AppLocalizations.of(context)!.account,
      children: [
        buildTile(
          Icons.history,
          AppLocalizations.of(context)!.savedSessions,
          AppLocalizations.of(context)!.savedSessionsSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
        switchTile(
          Icons.notifications,
          AppLocalizations.of(context)!.notifications,
          AppLocalizations.of(context)!.notificationsSubtitle,
          notificationsOn,
          (val) => setState(() => notificationsOn = val),
          fontSize: getFontSize(),
        ),
      ],
    );
  }

  SectionCard _buildPreferencesSection(BuildContext context) {
    return SectionCard(
      title: AppLocalizations.of(context)!.preferences,
      children: [
        sectionTitle(AppLocalizations.of(context)!.preferences, getFontSize()),
        buildTile(
          Icons.language,
          AppLocalizations.of(context)!.language,
          AppLocalizations.of(context)!.languageSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
          onTap: toggleLanguageFunc,
        ),
        textSizeTile(
          selectedSize: textSize,
          onChanged: (newSize) => setState(() => textSize = newSize),
        ),
        switchTile(
          Icons.offline_bolt,
          AppLocalizations.of(context)!.offlineMode,
          AppLocalizations.of(context)!.offlineModeSubtitle,
          offlineModeOn,
          (val) => setState(() => offlineModeOn = val),
          fontSize: getFontSize(),
        ),
      ],
    );
  }

  SectionCard _buildSupportSection(BuildContext context) {
    return SectionCard(
      title: AppLocalizations.of(context)!.support,
      children: [
        sectionTitle(AppLocalizations.of(context)!.support, getFontSize()),
        buildTile(
          Icons.help_outline,
          AppLocalizations.of(context)!.faq,
          AppLocalizations.of(context)!.faqSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
        buildTile(
          Icons.support_agent,
          AppLocalizations.of(context)!.contactSupport,
          AppLocalizations.of(context)!.contactSupportSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
        buildTile(
          Icons.warning_amber_rounded,
          AppLocalizations.of(context)!.emergencyHelp,
          AppLocalizations.of(context)!.emergencyHelpSubtitle,
          textColor: AppColors.redTriage,
          iconColor: AppColors.redTriage,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
      ],
    );
  }

  SectionCard _buildAboutSection(BuildContext context) {
    return SectionCard(
      title: AppLocalizations.of(context)!.about,
      children: [
        sectionTitle(AppLocalizations.of(context)!.about, getFontSize()),
        buildTile(
          Icons.article_outlined,
          AppLocalizations.of(context)!.terms,
          AppLocalizations.of(context)!.termsSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
        buildTile(
          Icons.info_outline,
          AppLocalizations.of(context)!.versionInfo,
          'RemedyMate v2.1.0',
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
      ],
    );
  }
}
