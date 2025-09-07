import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/l10n/arb/app_localizations.dart';

class RemedyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const RemedyAppBar({super.key, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appBarColor,
      title: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.drawerTextColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.greenTriage,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.check, color: AppColors.primaryDeepBlue),
          ),
          const SizedBox(width: 6),

          // Title
          const Text(
            'ChatSession',
            style: TextStyle(color: AppColors.drawerTextColor, fontSize: 20),
          ),

          const Spacer(),

          // Offline button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.amberTriage,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(40, 20),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                AppLocalizations.of(context)!.offline,
                style: const TextStyle(color: AppColors.drawerTextColor, fontSize: 12),
              ),
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
