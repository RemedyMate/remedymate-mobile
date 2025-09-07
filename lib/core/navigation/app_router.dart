import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/chatbot/presentation/pages/chat.dart';
import '../../features/chatbot/presentation/pages/chat_session.dart';
import '../../features/chatbot/presentation/pages/chatbot_home_page.dart';
import '../../features/chatbot/presentation/pages/offline_list_page.dart';
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
          // 0 → Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const ChatbotHomePage(),
              ),
            ],
          ),
          // 1 → Chats
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/chats',

                builder: (context, state) =>
                    SymptomCheckerPage(onLocaleChanged: onLocaleChanged),
              ),
            ],
          ),
          // 2 → Library
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/library',
                builder: (context, state) => const OfflineLibraryPage(),
              ),
            ],
          ),
          // 3 → Settings
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
      GoRoute(
        path: '/chat_sessions',
        builder: (context, state) => const ChatHistoryPage(),
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) =>
            SymptomCheckerPage(onLocaleChanged: onLocaleChanged),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const ChatbotHomePage(),
      ),
    ],
  );
}
