import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle header = TextStyle(
    fontFamily: 'NotoSansEthiopic',
    color: AppColors.primaryDeepBlue,
    fontSize: 24, // Example size, adjust as needed
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    height: 1.5, // Improves readability
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
}
