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


  // For the "RemedyMate" title
  static const TextStyle drawerHeader = TextStyle(
    fontFamily: 'Inter', // Using Inter for UI consistency
    color: AppColors.primaryDeepBlue,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle drawerItem = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: AppColors.drawerTextColor,
    fontWeight: FontWeight.w500, // A medium weight
  );

  // For the selected drawer item ("Home" in the image)
  static const TextStyle drawerItemSelected = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  // For the "Version 1.0.0" text at the bottom
  static const TextStyle versionText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: Colors.grey,
  );

  // For the "Logout" button
  static const TextStyle logoutText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: AppColors.redTriage, // Uses the red from your triage colors
    fontWeight: FontWeight.w500,
  );
}
