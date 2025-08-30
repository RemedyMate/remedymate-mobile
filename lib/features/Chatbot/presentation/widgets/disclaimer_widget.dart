import 'package:flutter/material.dart';
import 'package:remedy_mate/core/constants/app_text_styles.dart';
import 'package:remedy_mate/core/l10n/arb/app_localizations.dart';

class DisclaimerWidget extends StatelessWidget {
  const DisclaimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    const Color warningColor = Color(0xFFC66900);
    const Color backgroundColor = Color(0xFFFFF3E0);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: warningColor.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The Icon on the left
          const Icon(
            Icons.warning_amber_rounded,
            color: warningColor,
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
                    color: warningColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print("Learn More about disclaimer tapped");
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
                      color: warningColor,
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