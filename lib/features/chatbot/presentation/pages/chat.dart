import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/l10n/arb/app_localizations.dart';
import '../../domain/entities/chat_message.dart';
import '../bloc/chatbot_bloc.dart';
import '../widget/bot_response.dart';
import '../widget/guide_card.dart';
import '../widget/material.dart';
import '../widget/offline_mode.dart';
import '../widget/quick_chip.dart';

class SymptomCheckerPage extends StatefulWidget {
  final void Function(Locale) onLocaleChanged;

  const SymptomCheckerPage({super.key, required this.onLocaleChanged});

  @override
  State<SymptomCheckerPage> createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _messages = [];

  FollowUpMessage? _lastFollowUpMessage; // Tracks the current follow-up

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _addMessage(Widget message) {
    setState(() {
      _messages.add(message);
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(String input, BuildContext context) {
    if (input.isEmpty) return;

    if (_lastFollowUpMessage != null) {
      // Send answer to follow-up
      _addMessage(
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.greenTriage,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(input, style: const TextStyle(color: Colors.white)),
          ),
        ),
      );

      context.read<ChatbotBloc>().add(
        AnswerFollowUpEvent(
          conversationId: _lastFollowUpMessage!.conversationId,
          followUpId: _lastFollowUpMessage!.followUpId.toString(),
          answer: input,
          language: AppLocalizations.of(context)!.localeName,
        ),
      );

      _lastFollowUpMessage = null; // reset after sending
    } else {
      // Start new chat
      _addMessage(
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.greenTriage,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(input, style: const TextStyle(color: Colors.white)),
          ),
        ),
      );

      context.read<ChatbotBloc>().add(
        StartChatEvent(input, AppLocalizations.of(context)!.localeName),
      );
    }

    _controller.clear();
  }

  @override
  void initState() {
    super.initState();
    // Assign toggle function to section_tiles
    toggleLanguageFunc = toggleLanguage;
  }

  void toggleLanguage() {
    setState(() {
      if (language == 'EN ↔ Ahm') {
        language = 'Ahm ↔ EN';
        widget.onLocaleChanged(const Locale('am'));
      } else {
        language = 'EN ↔ Ahm';
        widget.onLocaleChanged(const Locale('en'));
      }
    });
    debugPrint('Language toggled: $language');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          l10n.symptomCheckerTitle,
          style: AppTextStyles.sectionHeader,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Offline banner
          Container(
            width: double.infinity,
            color: AppColors.amberTriage,
            padding: const EdgeInsets.all(8),
            child: const OfflineMode(),
          ),

          // Chat messages
          Expanded(
            child: BlocListener<ChatbotBloc, ChatbotState>(
              listener: (context, state) {
                if (state is ChatbotInitial) {
                  _lastFollowUpMessage = null;
                  _addMessage(BotMessage(l10n.symptomCheckerGreeting));
                } else if (state is FollowUpLoaded) {
                  final msg = state.message;

                  if (msg is FollowUpMessage) {
                    _lastFollowUpMessage = msg; // track follow-up
                    _addMessage(BotMessage(msg.question));
                  } else if (msg is GuideMessage) {
                    _lastFollowUpMessage = null; // guidance resets follow-up
                    _addMessage(GuidanceCard(guide: msg));
                  }
                } else if (state is ChatbotError) {
                  _addMessage(BotMessage(state.message, isError: true));
                }
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(12),
                itemCount: _messages.length,
                itemBuilder: (context, index) => _messages[index],
              ),
            ),
          ),

          // Input area
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: Column(
              children: [
                // Quick chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      QuickChip(l10n.today, controller: _controller),
                      QuickChip(l10n.yesterday, controller: _controller),
                      QuickChip(l10n.oneWeek, controller: _controller),
                      QuickChip(l10n.severePain, controller: _controller),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Input + Send
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
                          hintText: l10n.symptomCheckerHint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          filled: true,
                          fillColor: AppColors.background,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: AppColors.greenTriage,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () =>
                            _sendMessage(_controller.text.trim(), context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
