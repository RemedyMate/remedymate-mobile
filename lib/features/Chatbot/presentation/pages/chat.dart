import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chatbot_bloc.dart';
import '../widget/bot_response.dart';
import '../widget/guide_card.dart';
import '../widget/offline_mode.dart';
import '../widget/quick_chip.dart';
import '../widget/user_message.dart';

class SymptomCheckerPage extends StatefulWidget {
  const SymptomCheckerPage({super.key});

  @override
  State<SymptomCheckerPage> createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Checker'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            // Offline banner
            Container(
              width: double.infinity,
              color: Colors.amber[100],
              padding: const EdgeInsets.all(8),
              child: const OfflineMode(),
            ),

            // Chat messages
            Expanded(
              child: BlocBuilder<ChatbotBloc, ChatbotState>(
                builder: (context, state) {
                  if (state is ChatbotInitial) {
                    return const BotMessage(
                      'Hello! I’m RemedyMate. I can help you understand your symptoms and provide safe self-care guidance. What symptoms are you experiencing today?',
                    );
                  }

                  if (state is ChatbotLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FollowUpLoaded) {
                    return ListView(
                      padding: const EdgeInsets.all(12),
                      children: [
                        BotMessage(state.question),
                      ],
                    );
                  }

                  if (state is GuideLoaded) {
                    return ListView(
                      padding: const EdgeInsets.all(12),
                      children: [
                        GuidanceCard(guide: state.guideEntity),
                      ],
                    );
                  }

                  if (state is ChatbotError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),

            // Input section
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Column(
                children: [
                  Wrap(
                    spacing: 8,
                    children: [
                      QuickChip('Today', controller: _controller),
                      QuickChip('Yesterday', controller: _controller),
                      QuickChip('1 Week', controller: _controller),
                      QuickChip('Severe pain', controller: _controller),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.mic),
                            ),
                            hintText: 'Describe your symptoms...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: const Color(0xFF10B981),
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.black),
                          onPressed: () {
                            final input = _controller.text.trim();
                            if (input.isNotEmpty) {
                              context.read<ChatbotBloc>().add(StartChatEvent(input, 'en'));
                              _controller.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
