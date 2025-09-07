// section_tiles.dart (Updated version with fix)
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/l10n/arb/app_localizations.dart'; // Import AppLocalizations

// Global function placeholder (consider making it part of a service or BLoC)
VoidCallback? toggleLanguageFunc;

Widget buildTile(
  IconData icon,
  String title,
  String subtitle, {
  VoidCallback? onTap,
  TextStyle? titleStyle,
  TextStyle? subtitleStyle,
  Color? iconColor,
  Color? textColor,
}) {
  return ListTile(
    leading: Icon(icon, color: iconColor ?? AppColors.primaryDeepBlue),
    title: Text(
      title,
      style:
          titleStyle ??
          AppTextStyles.bodyMedium.copyWith(
            color: textColor ?? AppColors.textDark,
          ),
    ),
    subtitle: Text(
      subtitle,
      style:
          subtitleStyle ??
          AppTextStyles.labelMedium.copyWith(color: AppColors.textLightGrey),
    ),
    trailing: onTap != null
        ? const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: AppColors.lightBackground,
          )
        : null,
    onTap: onTap,
  );
}

Widget switchTile(
  IconData icon,
  String title,
  String subtitle,
  bool value,
  ValueChanged<bool> onChanged, {
  TextStyle? titleStyle,
  TextStyle? subtitleStyle,
  Color? iconColor,
  Color? textColor,
}) {
  return SwitchListTile(
    secondary: Icon(icon, color: iconColor ?? AppColors.primaryDeepBlue),
    title: Text(
      title,
      style:
          titleStyle ??
          AppTextStyles.bodyMedium.copyWith(
            color: textColor ?? AppColors.textDark,
          ),
    ),
    subtitle: Text(
      subtitle,
      style:
          subtitleStyle ??
          AppTextStyles.labelMedium.copyWith(color: AppColors.textLightGrey),
    ),
    value: value,
    onChanged: onChanged,
    // ignore: deprecated_member_use
    activeColor: AppColors.primaryBlue,
  );
}

Widget sectionTitle(String title, TextStyle style) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Text(title, style: style),
  );
}

// FIX: Added BuildContext context as a parameter
Widget textSizeTile(
  BuildContext context, { // <-- Added BuildContext here
  required String selectedSize,
  required ValueChanged<String> onChanged,
}) {
  return ListTile(
    leading: const Icon(Icons.format_size, color: AppColors.primaryDeepBlue),
    title: Text(
      AppLocalizations.of(
        context,
      )!.textSize, // <-- Now correctly uses the passed context
      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textDark),
    ),
    trailing: DropdownButton<String>(
      value: selectedSize,
      onChanged: (String? newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
      items: <String>['Small', 'Medium', 'Large'].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: AppTextStyles.bodyMedium),
          );
        },
      ).toList(),
      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryBlue),
      underline: Container(height: 0),
      iconEnabledColor: AppColors.primaryBlue,
    ),
  );
}
