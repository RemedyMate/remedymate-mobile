import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle header = TextStyle(
    fontFamily: 'NotoSansEthopic',
    color: AppColors.primaryDeepBlue,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    height: 1.5,
  );

  static const TextStyle bodyText18 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    height: 1.5,
  );

  static const TextStyle greenTriageText = TextStyle(
    fontFamily: 'Inter',
    color: AppColors.greenTriage,
    fontSize: 16,
  );

  static const TextStyle amberTriageText = TextStyle(
    fontFamily: 'Inter',
    color: AppColors.amberTriage,
    fontSize: 16,
  );

  static const TextStyle redTriageText = TextStyle(
    fontFamily: 'Inter',
    color: AppColors.redTriage,
    fontSize: 16,
  );

  static const TextStyle drawerHeader = TextStyle(
    fontFamily: 'Inter',
    color: AppColors.primaryDeepBlue,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle drawerItem = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: AppColors.drawerTextColor,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle drawerItemSelected = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle versionText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: Colors.grey,
  );

  static const TextStyle logoutText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: AppColors.redTriage,
    fontWeight: FontWeight.w500,
  );

  // --- NEW STYLES TO ADD FOR THE HOMEPAGE ---

  static const TextStyle sectionHeader = TextStyle(
    fontFamily: 'Inter',
    color: AppColors.primaryDeepBlue,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: 'Inter',
    color: AppColors.primaryDeepBlue,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    color: Colors.black54,
    fontWeight: FontWeight.normal,
  );

  // --- Base Font Families ---
  // Define these once if you use multiple font families
  static const String _defaultFontFamily = 'Inter'; // Your primary font
  static const String _ethiopianFontFamily =
      'NotoSansEthopic'; // For specific use cases

  // --- Headings ---
  // Large, prominent text styles for titles and major sections.
  static const TextStyle headlineLarge = TextStyle(
    fontFamily:
        _ethiopianFontFamily, // Used NotoSansEthopic here as it was for your original 'header'
    color: AppColors.primaryDeepBlue,
    fontSize: 32, // Increased for a stronger header
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.primaryDeepBlue,
    fontSize: 24,
    fontWeight: FontWeight
        .w900, // Matches your original sectionHeader for strong emphasis
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.primaryDeepBlue,
    fontSize: 22, // Good for drawer headers or sub-sections
    fontWeight: FontWeight.bold,
  );

  // --- Titles ---
  // For card titles, dialog titles, etc.
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.primaryDeepBlue,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.primaryDeepBlue,
    fontSize: 16,
    fontWeight: FontWeight.bold, // Good for card titles
  );

  // --- Body Text ---
  // Main content text styles.
  static TextStyle bodyLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 18,
    color: AppColors.textMediumGrey, // Default body text color
    height: 1.5,
  );

  static TextStyle bodyMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 16,
    color: AppColors.textMediumGrey, // Default body text color
    height: 1.5,
  );

  static TextStyle bodySmall = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 14,
    color: AppColors.textLightGrey, // For less prominent body text
    height: 1.4,
  );

  // --- Status & Triage Text Styles ---
  // Leveraging the new AppColors names.
  static const TextStyle successText = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.successGreen,
    fontSize: 16,
    fontWeight: FontWeight.w500, // Added slight weight for emphasis
  );

  static const TextStyle warningText = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.warningAmber,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle errorText = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.errorRed,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // --- Drawer Text Styles ---
  // More semantically named.
  static TextStyle drawerItemText = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 16,
    color: AppColors.textGrey, // Using the more general textGrey
    fontWeight: FontWeight.w500,
  );

  static const TextStyle drawerItemSelectedText = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 16,
    color: AppColors
        .white, // Selected items are often white on a colored background
    fontWeight: FontWeight.w500,
  );

  // --- Label & Caption Styles ---
  // Smaller text for labels, captions, footnotes.
  static TextStyle labelMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 14,
    color: AppColors.textLightGrey,
    fontWeight: FontWeight.normal,
  );

  static TextStyle labelSmall = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 12,
    color: AppColors.textLightGrey, // For card subtitles, version text
    fontWeight: FontWeight.normal,
  );

  // --- Button Text Styles ---
  static const TextStyle buttonText = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 16,
    color: AppColors.white, // Common for primary buttons
    fontWeight: FontWeight.w600, // A bit bolder for buttons
  );

  // --- Specific UI Element Styles ---
  // If truly unique, keep them, but try to use semantic ones first.
  static const TextStyle logoutButtonText = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 16,
    color: AppColors.errorRed, // Using errorRed for logout
    fontWeight: FontWeight.w500,
  );

  // --- Helper Styles for Chat Bubbles ---
  static const TextStyle bodyTextWhite = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.white,
    fontSize: 16,
    height: 1.5,
  );

  static TextStyle bodyTextGrey = TextStyle(
    fontFamily: _defaultFontFamily,
    color: AppColors.textLightGrey,
    fontSize: 16,
    height: 1.5,
  );

  // You can create more specific styles as needed,
  // but always try to map them to the core hierarchy first.
}
