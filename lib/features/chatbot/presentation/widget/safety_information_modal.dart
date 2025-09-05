import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/l10n/arb/app_localizations.dart';

import '../../../../core/l10n/arb/app_localizations.dart';

class SafetyInformationModal extends StatelessWidget {
  const SafetyInformationModal({super.key});

  static void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, _, __) => const SafetyInformationModal(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final safetyTexts = [
      l10n.safetyInfoPoint1, // e.g. "AI-powered guidance only"
      l10n.safetyInfoPoint2, // "Not a replacement for doctors"
      l10n.safetyInfoPoint3, // "Always consult professionals"
      l10n.safetyInfoPoint4, // "Call emergency services..."
    ];

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black54),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

            // Title
            Text(
              l10n.safetyInfoTitle, // "Important Safety Information"
              textAlign: TextAlign.center,
              style: AppTextStyles.sectionHeader.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDeepBlue,
              ),
            ),
            const SizedBox(height: 20),

            // Bulleted list
            ...safetyTexts.map(
              (text) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppColors.primaryDeepBlue,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        text,
                        style: AppTextStyles.bodyText.copyWith(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Understand button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDeepBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: AppTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(l10n.safetyInfoAction), // "I Understand"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
