import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class BotMessage extends StatelessWidget {
  final String text;
  final bool isError;
  const BotMessage(this.text, {this.isError = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightPrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }
}
