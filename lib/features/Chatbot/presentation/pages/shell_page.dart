import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:remedy_mate/features/Chatbot/presentation/widgets/bottom_nav.dart';

class ShellPage extends StatelessWidget {
 
  final StatefulNavigationShell navigationShell;

  const ShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: navigationShell,


      bottomNavigationBar: BottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
         
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}