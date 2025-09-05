import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
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


