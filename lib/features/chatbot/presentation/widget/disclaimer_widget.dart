import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/l10n/arb/app_localizations.dart';

class DisclaimerWidget extends StatelessWidget {
  const DisclaimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:AppColors.backgrounddisclaimer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color:AppColors.redTriage,),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     
          const Icon(
            Icons.warning_amber_rounded,
            color: AppColors.redTriage,
            size: 24,
          ),
          const SizedBox(width: 12),

          Flexible( 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.disclaimerText,
                  style: AppTextStyles.bodyText.copyWith(
                    color: AppColors.redTriage,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('Learn More about disclaimer tapped');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    l10n.learnMore,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color:AppColors.redTriage,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}