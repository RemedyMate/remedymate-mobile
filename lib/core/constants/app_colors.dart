import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryDeepBlue = Color(0xFF0D2A4B);
  static const Color greenTriage = Color(0xFF10B981);
  static const Color amberTriage = Color(0xFFF59E0B);
  static const Color redTriage = Color(0xFFEF4444);
  static const Color drawerBackground = Color(0xFFE5E7EB);
  static const Color drawerTextColor = Color(0xFF4B5563);
  static const Color tileBackground = Color(0xFFFFFFFF);
  static const Color appBarColor = Color(0xFFE5E7EB);
  static const Color border = Colors.grey;
  static const Color black = Colors.black;
  static Color backgrounddisclaimer = const Color(0xFFFFF3E0);

  // Additional colors for consistency
  static const Color accentGreenDarkText = Color(0xff004D40);
  static const Color emergencyRedLight = Color(0xffFFCDD2);

  static const Color white = Colors.white;

  // Backgrounds
  static const Color background = Color(0xFFF4F7FA);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Primary Theme
  static const Color primaryBlue = Color(0xFF1E56A0);

  // Quick Access Colors
  static final Color symptomRed = Colors.red.shade300;
  static final Color libraryBlue = Colors.blue.shade300;
  static final Color savedGreen = Colors.green.shade300;
  static final Color emergencyRed = Colors.red.shade400;

  // Status
  static const Color onlineGreen = Colors.green;

  // Text
  static final Color textGrey = Colors.grey.shade700;
  static final Color subtitleGrey = Colors.grey.shade600;
  static final Color dividerGrey = Colors.grey.shade200;

  static const Color lightPrimary = Color.fromRGBO(210, 223, 231, 1);
  static const Color lightBackground = Color.fromRGBO(241, 247, 249, 1);

  static const Color accentBlue = Color(
    0xFF1565C0,
  ); // From your original send button, good accent

  // --- Triage & Status Colors ---
  // Colors specifically for status indicators (e.g., severity, online status).
  static const Color successGreen = Color(
    0xFF10B981,
  ); // Renamed from greenTriage for broader use
  static const Color warningAmber = Color(
    0xFFF59E0B,
  ); // Renamed from amberTriage
  static const Color errorRed = Color(0xFFEF4444); // Renamed from redTriage

  // --- Background & Surface Colors ---
  // Colors for main backgrounds, cards, and UI elements.

  // --- Text & Icon Colors ---
  // Colors specifically for text and icons to ensure readability and hierarchy.
  static const Color textDark =
      primaryDeepBlue; // Using primary for main dark text
  static final Color textMediumGrey =
      Colors.grey.shade700; // Medium grey text for secondary info
  static final Color textLightGrey =
      Colors.grey.shade600; // Lighter grey for subtitles

  // --- Border & Divider Colors ---
  // For separating UI elements.
  static final Color borderGrey =
      Colors.grey.shade400; // Slightly darker grey for borders

  // --- App-Specific UI Elements ---
  // Colors for specific components that might not fit generic categories.
  static const Color appBarBackground =
      white; // Assuming app bar is generally white

  // --- Quick Access / Thematic Colors (Consider if these should be more dynamic/semantic) ---
  // These are often highly contextual. If they're just shades, consider using the `text` or `status` palette.
  // If they represent specific features (e.g., symptom, library), they might be fine as is.
  static final Color quickAccessSymptomRed = Colors.red.shade300;
  static final Color quickAccessLibraryBlue = Colors.blue.shade300;
  static final Color quickAccessSavedGreen = Colors.green.shade300;
  static final Color quickAccessEmergencyRed =
      Colors.red.shade400; // Stronger red for emphasis

  // --- Special/Alert Backgrounds ---
  static Color disclaimerBackground = const Color(
    0xFFFFF3E0,
  ); // Light orange/yellow for disclaimers
}
