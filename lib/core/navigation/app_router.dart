import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/Chatbot/presentation/pages/chatbot_home_page.dart';
import '../../features/Chatbot/presentation/pages/shell_page.dart'; 
final GoRouter router = GoRouter(
  initialLocation: '/home', // Tell the app to start at the '/home' path
  routes: [
    // This StatefulShellRoute is the key. It creates the persistent navigation.
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // This builder returns the "Frame" widget that holds the BottomNav.
        return ShellPage(navigationShell: navigationShell);
      },
      branches: [
        // Each branch represents a tab on the bottom navigation bar.
        
        // Branch 0: Corresponds to the 'Home' tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const ChatbotHomePage(),
            ),
          ],
        ),

        // Branch 1: Corresponds to the 'Chats' tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/chats',
              // Since this page isn't ready, we use a simple placeholder.
              builder: (context, state) => const Center(child: Text('Chats Page')),
            ),
          ],
        ),

        // Branch 2: Corresponds to the 'Library' tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/library',
              builder: (context, state) => const Center(child: Text('Library Page')),
            ),
          ],
        ),

        // Branch 3: Corresponds to the 'Settings' tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const Center(child: Text('Settings Page')),
            ),
          ],
        ),
      ],
    ),
  ],
);