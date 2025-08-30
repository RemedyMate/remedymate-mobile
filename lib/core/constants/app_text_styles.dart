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
    fontSize: 18,
    fontWeight: FontWeight.bold,
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
  
}
