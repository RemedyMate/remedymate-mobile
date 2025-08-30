import 'package:flutter/material.dart';
import 'package:remedy_mate/core/constants/app_colors.dart';
import 'package:remedy_mate/core/constants/app_text_styles.dart';
import 'package:remedy_mate/core/l10n/arb/app_localizations.dart';

class LocalTipsCard extends StatelessWidget {
  const LocalTipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
     
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       
        mainAxisSize: MainAxisSize.min,

        children: [
          Text(l10n.localTipsTitle, style: AppTextStyles.cardTitle),
          const SizedBox(height: 12),
          Text(
            l10n.localTipRemedies,
            style: AppTextStyles.cardSubtitle,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.localTipWarnings,
            style: AppTextStyles.cardSubtitle,
          ),
         
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              print("Navigate to Learn More");
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            child: const Text(
              "Learn more",
              style: TextStyle(
                color: AppColors.greenTriage,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}