// Placeholder for section_card.dart - You MUST update this file accordingly!
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart'; // Import AppTextStyles

class SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SectionCard({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Consistent elevation
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero, // No default margin
      color: AppColors.cardBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                title,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.textDark,
                ), // Consistent section title style
              ),
            ),
            Divider(
              height: 1,
              color: AppColors.dividerGrey,
            ), // Consistent divider
            ...children,
          ],
        ),
      ),
    );
  }
}
