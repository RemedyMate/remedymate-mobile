import 'package:flutter/material.dart';

import '../../../generated/app_localizations.dart';
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
  String textSize = "Medium";
  String language = "EN ↔ Ahm";

  @override
  void initState() {
    super.initState();
    // Assign toggle function to section_tiles
    toggleLanguageFunc = toggleLanguage;
  }

  // Get font size based on textSize
  double getFontSize() {
    switch (textSize) {
      case "Small":
        return 12;
      case "Medium":
        return 16;
      case "Large":
        return 20;
      default:
        return 16;
    }
  }

  // Toggle language
  void toggleLanguage() {
    setState(() {
      if (language == "EN ↔ Ahm") {
        language = "Ahm ↔ EN";
        widget.onLocaleChanged(const Locale('am'));
      } else {
        language = "EN ↔ Ahm";
        widget.onLocaleChanged(const Locale('en'));
      }
    });
    debugPrint("Language toggled: $language");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          S.of(context)!.settings,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getFontSize(),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: toggleLanguage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(language, style: TextStyle(fontSize: getFontSize() - 2)),
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
      title: S.of(context)!.account,
      children: [
        buildTile(
          Icons.history,
          S.of(context)!.savedSessions,
          S.of(context)!.savedSessionsSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
        switchTile(
          Icons.notifications,
          S.of(context)!.notifications,
          S.of(context)!.notificationsSubtitle,
          notificationsOn,
          (val) => setState(() => notificationsOn = val),
          fontSize: getFontSize(),
        ),
      ],
    );
  }

  SectionCard _buildPreferencesSection(BuildContext context) {
    return SectionCard(
      title: S.of(context)!.preferences,
      children: [
        sectionTitle(S.of(context)!.preferences, getFontSize()),
        buildTile(
          Icons.language,
          S.of(context)!.language,
          S.of(context)!.languageSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
          onTap: toggleLanguageFunc,
        ),
        textSizeTile(
          selectedSize: textSize,
          onChanged: (newSize) => setState(() => textSize = newSize),
        ),
        switchTile(
          Icons.offline_bolt,
          S.of(context)!.offlineMode,
          S.of(context)!.offlineModeSubtitle,
          offlineModeOn,
          (val) => setState(() => offlineModeOn = val),
          fontSize: getFontSize(),
        ),
      ],
    );
  }

  SectionCard _buildSupportSection(BuildContext context) {
    return SectionCard(
      title: S.of(context)!.support,
      children: [
        sectionTitle(S.of(context)!.support, getFontSize()),
        buildTile(
          Icons.help_outline,
          S.of(context)!.faq,
          S.of(context)!.faqSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
        buildTile(
          Icons.support_agent,
          S.of(context)!.contactSupport,
          S.of(context)!.contactSupportSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
        buildTile(
          Icons.warning_amber_rounded,
          S.of(context)!.emergencyHelp,
          S.of(context)!.emergencyHelpSubtitle,
          textColor: Colors.red,
          iconColor: Colors.red,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
      ],
    );
  }

  SectionCard _buildAboutSection(BuildContext context) {
    return SectionCard(
      title: S.of(context)!.about,
      children: [
        sectionTitle(S.of(context)!.about, getFontSize()),
        buildTile(
          Icons.article_outlined,
          S.of(context)!.terms,
          S.of(context)!.termsSubtitle,
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
        buildTile(
          Icons.info_outline,
          S.of(context)!.versionInfo,
          "RemedyMate v2.1.0",
          textStyle: TextStyle(fontSize: getFontSize()),
        ),
      ],
    );
  }
}