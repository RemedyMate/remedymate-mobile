import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/chatbot/presentation/pages/chat.dart';
import '../../features/chatbot/presentation/pages/chatbot_home_page.dart';
import '../../features/chatbot/presentation/pages/shell_page.dart';
import '../../features/onboarding/pages/setting_page.dart';

GoRouter router(void Function(Locale) onLocaleChanged) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const ChatbotHomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/chats',
                builder: (context, state) => SymptomCheckerPage(onLocaleChanged: onLocaleChanged),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/library',
                builder: (context, state) =>
                    const Center(child: Text('Library Page')),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) =>
                    SettingPage(onLocaleChanged: onLocaleChanged),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
