import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  static const List<IconData> _icons = [
    Icons.home_outlined,
    Icons.chat_bubble_outline,
    Icons.library_books_outlined,
    Icons.settings_outlined,
  ];

  static const List<IconData> _activeIcons = [
    Icons.home,
    Icons.chat_bubble,
    Icons.library_books,
    Icons.settings,
  ];

  static const List<String> _labels = ['Home', 'Chats', 'Library', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.primaryDeepBlue,
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        items: List.generate(
          _labels.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(_icons[index], size: 26),
            activeIcon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primaryDeepBlue.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _activeIcons[index],
                size: 28,
                color: AppColors.primaryDeepBlue,
              ),
            ),
            label: _labels[index],
          ),
        ),
      ),
    );
  }
}
