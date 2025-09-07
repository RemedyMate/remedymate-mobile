import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class BotMessage extends StatelessWidget {
  final String? heading;
  final String? subheading;
  final String? question;
  final bool isError;

  const BotMessage({
    super.key,
    this.heading,
    this.subheading,
    this.question,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isError ? Colors.red[100] : AppColors.lightPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (heading != null && heading!.isNotEmpty)
              Text(
                heading!,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.primaryDeepBlue,
                  fontSize: 18,
                ),
              ),
            if (heading != null && heading!.isNotEmpty)
              const SizedBox(height: 4),
            if (subheading != null && subheading!.isNotEmpty)
              Text(
                '${subheading!}:',
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.primaryDeepBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            if (subheading != null && subheading!.isNotEmpty)
              const SizedBox(height: 8),
            if (question != null && question!.isNotEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryDeepBlue,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      question!,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.primaryDeepBlue,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
