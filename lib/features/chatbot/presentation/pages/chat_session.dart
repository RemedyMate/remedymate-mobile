import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart'; // Import the new text styles
import '../../../../core/l10n/arb/app_localizations.dart';
import '../../domain/entities/chat_session_entity.dart';
import '../bloc/chatbot_bloc.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Optionally trigger loading of sessions when the page is built
    // This ensures sessions are loaded when navigating to this page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatbotBloc>().add(LoadChatSessions());
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        // Consistent AppBar styling
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded, // Modern back icon
            color: AppColors.primaryDeepBlue,
            size: 28,
          ),
          onPressed: () {
            // Use go_router for navigation consistency
            context.go('/home'); // Assuming going back to home page
          },
        ),
        title: Text(
          'Chat History', // Localized title
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.primaryDeepBlue,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white, // Use white for app bar background
        elevation: 2, // Added elevation for a more defined look
        actions: [
          // Offline status / button
          // Re-imagined as a simple status text or a chip, not a TextButton inside AppBar actions
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Chip(
              backgroundColor: AppColors.warningAmber.withOpacity(
                0.15,
              ), // Softer background
              label: Text(
                l10n.offline,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.warningAmber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              side: BorderSide(color: AppColors.warningAmber, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 0,
              ), // Adjust padding
            ),
          ),
        ],
      ),

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

class ChatSessionTile extends StatelessWidget {
  final ChatSession session;
  const ChatSessionTile({super.key, required this.session});

  Color _getStatusColor(String status) {
    // Map your session status strings to your AppColors
    switch (status.toLowerCase()) {
      case 'active':
        return AppColors.successGreen;
      case 'pending':
        return AppColors.warningAmber;
      case 'resolved':
        return AppColors.primaryBlue; // Or a different color for resolved
      case 'error':
        return AppColors.errorRed;
      default:
        return AppColors.textLightGrey; // Default for unknown status
    }
  }

  @override
  Widget build(BuildContext context) {
    final sessionStatusColor = _getStatusColor(session.status);

    return InkWell(
      // Use InkWell for better tap feedback
      onTap: () {
        context.go('/chat_details', extra: session.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ), // Increased horizontal margin
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ), // Increased vertical padding
        decoration: BoxDecoration(
          color: AppColors.cardBackground, // Use cardBackground for tiles
          borderRadius: BorderRadius.circular(16), // More rounded corners
          boxShadow: [
            BoxShadow(
              color: AppColors.dividerGrey.withOpacity(
                0.5,
              ), // Softer shadow color
              spreadRadius: 1,
              blurRadius: 5, // Increased blur for a softer shadow
              offset: const Offset(0, 2), // Slightly lower shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.title,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textDark,
                    ), // Strong title style
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // if (session.lastMessage != null && session.lastMessage!.isNotEmpty) // Display last message
                  //   Text(
                  //     session.lastMessage!, // Assuming ChatSession has a lastMessage field
                  //     style: AppTextStyles.bodySmall.copyWith(color: AppColors.textLightGrey),
                  //     maxLines: 1,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // You might also want to display a timestamp here
                  // Text(
                  //   session.timestamp, // Assuming ChatSession has a timestamp
                  //   style: AppTextStyles.labelSmall.copyWith(color: AppColors.textLightGrey),
                  // ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: sessionStatusColor,
                ), // Smaller icon
                const SizedBox(width: 6),
                Text(
                  session.status,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: sessionStatusColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// NOTE: You'll need to ensure your ChatSessionEntity has a `lastMessage` field and a `status` field.
// Example for ChatSessionEntity:
/*
class ChatSession {
  final String id;
  final String title;
  final String status; // e.g., 'active', 'pending', 'resolved'
  final String? lastMessage; // Optional last message for display
  // final DateTime timestamp; // Optional timestamp

  ChatSession({
    required this.id,
    required this.title,
    required this.status,
    this.lastMessage,
    // required this.timestamp,
  });

  // Example for statusColor (can be moved here or kept in tile)
  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'active': return AppColors.successGreen;
      case 'pending': return AppColors.warningAmber;
      case 'resolved': return AppColors.primaryBlue;
      default: return AppColors.textLightGrey;
    }
  }
}
*/
