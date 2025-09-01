import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/chat_session_entity.dart';
import '../bloc/chatbot_bloc.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(Icons.arrow_back),
              const SizedBox(width: 8),
              const Text('AI Chat Sessions'),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'offline',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
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
          onPressed: () {
            // Add new session
          },
          child: const Icon(Icons.add),
        ),
      );
  }
}

class ChatSessionTile extends StatelessWidget {
  final ChatSession session;
  const ChatSessionTile({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        session.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 12, color: session.statusColor),
          const SizedBox(width: 6),
          Text(
            session.status,
            style: TextStyle(color: session.statusColor),
          ),
        ],
      ),
      onTap: () {
        // Navigate to session details
      },
    );
  }
}
