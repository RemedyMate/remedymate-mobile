import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/l10n/arb/app_localizations.dart';
import '../../domain/entities/chat_session_entity.dart';
import '../bloc/chatbot_bloc.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarColor,
        title: Row(
          children: [
            // Back arrow
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.drawerTextColor,
              ),
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

            // // Title
            // Text(
            //   AppLocalizations.of(context)!.aiChatSessions,
            //   style: const TextStyle(
            //     color: AppColors.drawerTextColor,
            //     fontSize: 20,
            //   ),
            // ),
            const Spacer(), // Push buttons to the right
            // Offline button (smaller)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.amberTriage,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // remove extra padding
                  minimumSize: const Size(40, 20), // make button smaller
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  AppLocalizations.of(context)!.offline,
                  style: const TextStyle(
                    color: AppColors.drawerTextColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),
          ],
        ),
      ),

      body: BlocBuilder<ChatbotBloc, ChatbotState>(
        builder: (context, state) {
          if (state is ChatSessionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatSessionLoaded) {
            return ListView.separated(
              itemCount: state.sessions.length,
              separatorBuilder: (_, d) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final session = state.sessions[index];
                return ChatSessionTile(session: session);
              },
            );
          } else if (state is ChatbotError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryDeepBlue,
        onPressed: () {
          // Add new session
        },
        child: const Icon(Icons.add, color: AppColors.drawerBackground),
      ),
    );
  }
}

class ChatSessionTile extends StatelessWidget {
  final ChatSession session;
  const ChatSessionTile({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.tileBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: ListTile(
        title: Text(
          session.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, size: 12, color: session.statusColor),
            const SizedBox(width: 6),
            Text(session.status, style: TextStyle(color: session.statusColor)),
          ],
        ),
        onTap: () {
          // Navigate to session details
        },
      ),
    );
  }
}
