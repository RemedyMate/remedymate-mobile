import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart'; // Import AppTextStyles
import '../../../core/l10n/arb/app_localizations.dart';

import '../widgets/section_card.dart'; // Ensure this is updated
import '../widgets/section_tiles.dart'; // Ensure this is updated

class SettingPage extends StatefulWidget {
  final void Function(Locale) onLocaleChanged;

  const SettingPage({super.key, required this.onLocaleChanged});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool notificationsOn = true;
  bool offlineModeOn = false;
  String textSize =
      'Medium'; // This will control the actual font size, but AppTextStyles will be the base.
  String languageToggleText = 'EN ↔ AM'; // Updated variable name for clarity

  @override
  void initState() {
    super.initState();
    // Initialize languageToggleText based on current locale
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateLanguageToggleText(Localizations.localeOf(context));
    });
    // Assign toggle function to section_tiles (if still necessary, consider alternatives)
    toggleLanguageFunc = toggleLanguage;
  }

  // Update the language toggle text display
  void _updateLanguageToggleText(Locale locale) {
    setState(() {
      if (locale.languageCode == 'en') {
        languageToggleText = 'EN ↔ AM';
      } else {
        languageToggleText = 'AM ↔ EN';
      }
    });
  }

  // Toggle language
  void toggleLanguage() {
    setState(() {
      Locale newLocale;
      if (Localizations.localeOf(context).languageCode == 'en') {
        newLocale = const Locale('am');
      } else {
        newLocale = const Locale('en');
      }
      widget.onLocaleChanged(newLocale);
      _updateLanguageToggleText(newLocale); // Update the displayed text
    });
    debugPrint('Language toggled: $languageToggleText');
  }

  // --- Accessibility/Dynamic Font Sizing (Re-introducing with Theme) ---
  // This is a more robust way to handle dynamic text sizing.
  // You would typically wrap your MaterialApp with a Provider for this setting.
  // For simplicity, this example just uses a scale factor.
  double _getFontScaleFactor() {
    switch (textSize) {
      case 'Small':
        return 0.8; // 80% of base font size
      case 'Medium':
        return 1.0; // 100%
      case 'Large':
        return 1.2; // 120%
      default:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final fontScaleFactor =
        _getFontScaleFactor(); // Get the current scale factor

    // Create a custom TextTheme based on the font scale factor
    final TextTheme scaledTextTheme = Theme.of(context).textTheme.copyWith(
      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        fontSize: AppTextStyles.headlineLarge.fontSize! * fontScaleFactor,
      ),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        fontSize: AppTextStyles.headlineMedium.fontSize! * fontScaleFactor,
      ),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(
        fontSize: AppTextStyles.headlineSmall.fontSize! * fontScaleFactor,
      ),
      titleLarge: AppTextStyles.titleLarge.copyWith(
        fontSize: AppTextStyles.titleLarge.fontSize! * fontScaleFactor,
      ),
      titleMedium: AppTextStyles.titleMedium.copyWith(
        fontSize: AppTextStyles.titleMedium.fontSize! * fontScaleFactor,
      ),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        fontSize: AppTextStyles.bodyLarge.fontSize! * fontScaleFactor,
      ),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        fontSize: AppTextStyles.bodyMedium.fontSize! * fontScaleFactor,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        fontSize: AppTextStyles.bodySmall.fontSize! * fontScaleFactor,
      ),
      labelMedium: AppTextStyles.labelMedium.copyWith(
        fontSize: AppTextStyles.labelMedium.fontSize! * fontScaleFactor,
      ),
      labelSmall: AppTextStyles.labelSmall.copyWith(
        fontSize: AppTextStyles.labelSmall.fontSize! * fontScaleFactor,
      ),
      // Extend for other styles like buttonText if needed
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.settings,
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.primaryDeepBlue,
          ), // Consistent title style
        ),
        // centerTitle: true, // Center the title
        backgroundColor: AppColors.white, // Use white for app bar background
        elevation: 2, // Consistent elevation
        actions: [
          GestureDetector(
            onTap: toggleLanguage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(
                right: 16,
                top: 8,
                bottom: 8,
              ), // Increased right margin
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderGrey,
                ), // Use borderGrey
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white, // Explicit white background
              ),
              child: Text(
                languageToggleText, // Use the updated variable
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.primaryBlue,
                ), // Use a semantic style
              ),
            ),
          ),
        ],
      ),
      body: Theme(
        // Apply the scaled TextTheme locally to this part of the tree
        data: Theme.of(context).copyWith(textTheme: scaledTextTheme),
        child: ListView(
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
      ),
    );
  }

  SectionCard _buildAccountSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SectionCard(
      title: l10n.account,
      children: [
        buildTile(
          Icons.history,
          l10n.savedSessions,
          l10n.savedSessionsSubtitle,
          onTap: () {
            // Add navigation logic for saved sessions here, e.g., using go_router
            // context.go('/chat_sessions');
          },
          // No need to pass fontSize, buildTile uses TextStyles
        ),
        switchTile(
          Icons.notifications,
          l10n.notifications,
          l10n.notificationsSubtitle,
          notificationsOn,
          (val) => setState(() => notificationsOn = val),
          // No need to pass fontSize
        ),
      ],
    );
  }

  SectionCard _buildPreferencesSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SectionCard(
      title: l10n.preferences,
      children: [
        // sectionTitle(l10n.preferences, AppTextStyles.headlineSmall.copyWith(color: AppColors.textDark)),
        // The SectionCard already has a title, so this inner sectionTitle is redundant.
        buildTile(
          Icons.language,
          l10n.language,
          l10n.languageSubtitle,
          onTap: toggleLanguageFunc,
        ),
        // In _buildPreferencesSection(BuildContext context) in SettingPage
        textSizeTile(
          context, // <-- Pass context here
          selectedSize: textSize,
          onChanged: (newSize) => setState(() => textSize = newSize),
        ),
        switchTile(
          Icons.offline_bolt,
          l10n.offlineMode,
          l10n.offlineModeSubtitle,
          offlineModeOn,
          (val) => setState(() => offlineModeOn = val),
        ),
      ],
    );
  }

  SectionCard _buildSupportSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SectionCard(
      title: l10n.support,
      children: [
        // sectionTitle(l10n.support, AppTextStyles.headlineSmall.copyWith(color: AppColors.textDark)),
        // Redundant as SectionCard already has a title.
        buildTile(Icons.help_outline, l10n.faq, l10n.faqSubtitle),
        buildTile(
          Icons.support_agent,
          l10n.contactSupport,
          l10n.contactSupportSubtitle,
        ),
        buildTile(
          Icons.warning_amber_rounded,
          l10n.emergencyHelp,
          l10n.emergencyHelpSubtitle,
          textColor: AppColors.errorRed, // Using errorRed for emergency text
          iconColor: AppColors.errorRed, // Using errorRed for emergency icon
        ),
      ],
    );
  }

  SectionCard _buildAboutSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SectionCard(
      title: l10n.about,
      children: [
        // sectionTitle(l10n.about, AppTextStyles.headlineSmall.copyWith(color: AppColors.textDark)),
        // Redundant as SectionCard already has a title.
        buildTile(Icons.article_outlined, l10n.terms, l10n.termsSubtitle),
        buildTile(
          Icons.info_outline,
          l10n.versionInfo,
          'RemedyMate v2.1.0', // This can be dynamic if stored elsewhere
        ),
      ],
    );
  }
}
