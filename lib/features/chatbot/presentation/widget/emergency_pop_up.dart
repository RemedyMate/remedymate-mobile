import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/l10n/arb/app_localizations.dart';

import '../../../../core/l10n/arb/app_localizations.dart';

class EmergencyModal {
  static const List<Map<String, String>> emergencyNumbers = [
    {'key': 'emergencyServices', 'number': '911', 'color': 'red'},
    {'key': 'poisonControl', 'number': '1-800-222-1222', 'color': 'blue'},
    {'key': 'mentalHealthCrisis', 'number': '988', 'color': 'green'},
  ];

  static void show(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, animation, _, __) {
        final curvedValue = Curves.easeInOut.transform(animation.value) - 1.0;

        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -50, 0.0),
          child: Opacity(
            opacity: animation.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.emergencyTitle,
                          style: AppTextStyles.sectionHeader.copyWith(
                            color: AppColors.redTriage,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Numbers
                    ...emergencyNumbers.map((item) {
                      final color = _getColor(item['color']!);
                      final title = _getLocalizedTitle(l10n, item['key']!);

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: color.withValues(alpha: 0.4),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: color,
                            child: const Icon(Icons.phone, color: Colors.white),
                          ),
                          title: Text(
                            title,
                            style: AppTextStyles.bodyText.copyWith(
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                          subtitle: Text(item['number']!),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              final Uri callUri = Uri(
                                scheme: 'tel',
                                path: item['number'],
                              );
                              if (await canLaunchUrl(callUri)) {
                                await launchUrl(callUri);
                              } else {
                                debugPrint('Could not launch call');
                              }
                            },
                            child: Text(
                              l10n.callAction,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 12),

                    // Close Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryDeepBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          l10n.closeAction,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Color _getColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  static String _getLocalizedTitle(AppLocalizations l10n, String key) {
    switch (key) {
      case 'emergencyServices':
        return l10n.emergencyServices;
      case 'poisonControl':
        return l10n.poisonControl;
      case 'mentalHealthCrisis':
        return l10n.mentalHealthCrisis;
      default:
        return key;
    }
  }
}
