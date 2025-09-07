import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../bloc/chatbot_bloc.dart';
import '../widget/app_bar.dart';
import '../widget/chat_session_tile.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: AppColors.background,
        appBar: const RemedyAppBar(),

      body: BlocBuilder<ChatbotBloc, ChatbotState>(
        builder: (context, state) {
          if (state is ChatSessionLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryBlue),
            ); // Consistent color
          } else if (state is ChatSessionLoaded) {
            if (state.sessions.isEmpty) {
              return Center(
                child: Text(
                  'No session found', // Localized message for empty state
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textLightGrey,
                  ),
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ), // Add vertical padding to the list
              itemCount: state.sessions.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 8), // Use SizedBox for spacing
              itemBuilder: (context, index) {
                final session = state.sessions[index];
                return ChatSessionTile(session: session);
              },
            );
          } else if (state is ChatbotError) {
            return Center(
              child: Text(state.message, style: AppTextStyles.errorText),
            ); // Use error text style
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Reset session / start new chat
          context.go('/chat'); // Navigate to your chat screen
        },
        backgroundColor: AppColors.primaryDeepBlue,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'New Chat',
          style: AppTextStyles.header.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}


