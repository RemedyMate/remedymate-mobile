import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      elevation: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),

              // --- Navigation Items ---
              ..._navItems.map(
                (item) => _buildDrawerItem(
                  icon: item.icon,
                  title: item.title,
                  onTap: item.onTap,
                  isSelected: item.isSelected,
                ),
              ),

              const Spacer(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryDeepBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            tooltip: 'Close drawer',
            onPressed: () {
              // Optional: Navigator.pop(context);
            },
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text('RemedyMate', style: AppTextStyles.drawerHeader),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDeepBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          icon: const Icon(Icons.swap_horiz, color: Colors.white, size: 18),
          label: const Text('EN', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryDeepBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : AppColors.drawerTextColor,
        ),
        title: Text(
          title,
          style: isSelected
              ? AppTextStyles.drawerItemSelected
              : AppTextStyles.drawerItem,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Version 1.0.0', style: AppTextStyles.versionText),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft,
          ),
          child: const Text('Logout', style: AppTextStyles.logoutText),
        ),
      ],
    );
  }
}

class _DrawerItemData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const _DrawerItemData({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });
}

final List<_DrawerItemData> _navItems = [
  _DrawerItemData(
    icon: Icons.home_filled,
    title: 'Home',
    onTap: () {},
    isSelected: true,
  ),
  _DrawerItemData(
    icon: Icons.chat_bubble_outline,
    title: 'Chats',
    onTap: () {},
  ),
  _DrawerItemData(
    icon: Icons.check_box_outline_blank,
    title: 'Library',
    onTap: () {},
  ),
  _DrawerItemData(
    icon: Icons.settings_outlined,
    title: 'Settings',
    onTap: () {},
  ),
  _DrawerItemData(
    icon: Icons.help_outline,
    title: 'Help & Support',
    onTap: () {},
  ),
  _DrawerItemData(icon: Icons.info_outline, title: 'About', onTap: () {}),
];
