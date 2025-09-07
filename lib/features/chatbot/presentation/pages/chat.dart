import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/l10n/arb/app_localizations.dart';
import '../../domain/entities/chat_message.dart';
import '../bloc/chatbot_bloc.dart';
import '../widget/bot_response.dart';
import '../widget/guide_card.dart';
import '../widget/material.dart'; // Assuming this defines `toggleLanguageFunc`

class SymptomCheckerPage extends StatefulWidget {
  final void Function(Locale) onLocaleChanged;

  const SymptomCheckerPage({super.key, required this.onLocaleChanged});

  @override
  State<SymptomCheckerPage> createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _chatBubbles = []; // Renamed for clarity

  Locale _currentLocale = const Locale('en'); // Tracks the current locale
  FollowUpMessage? _lastFollowUpMessage; // Tracks the current follow-up
  bool _showInputField = true; // Renamed for consistency

  @override
  void initState() {
    super.initState();
    // Assign toggle function to section_tiles (if applicable, ensure 'material.dart' handles this correctly)
    toggleLanguageFunc = toggleLanguage;
    // Initial bot greeting
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addBotMessage(AppLocalizations.of(context)!.symptomCheckerGreeting);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Helper to add bot messages
  void _addBotMessage(String text, {bool isError = false}) {
    setState(() {
      _chatBubbles.add(BotMessage(text, isError: isError));
    });
    _scrollToBottom();
  }

  // Helper to add user messages
  void _addUserMessage(String text) {
    setState(() {
      _chatBubbles.add(
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: const BoxDecoration(
              color:
                  AppColors.primaryDeepBlue, // User messages in primary color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Text(text, style: AppTextStyles.bodyTextWhite),
          ),
        ),
      );
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(String input, BuildContext context) {
    if (input.trim().isEmpty) return;

    _addUserMessage(input);
    _controller.clear();

    final l10n = AppLocalizations.of(context)!;

    if (_lastFollowUpMessage != null) {
      context.read<ChatbotBloc>().add(
        AnswerFollowUpEvent(
          conversationId: _lastFollowUpMessage!.conversationId,
          followUpId: _lastFollowUpMessage!.followUpId.toString(),
          answer: input,
          language: l10n.localeName,
        ),
      );
      _lastFollowUpMessage = null; // Reset after sending
    } else {
      context.read<ChatbotBloc>().add(StartChatEvent(input, l10n.localeName));
    }
  }

  void toggleLanguage() {
    setState(() {
      if (_currentLocale.languageCode == 'en') {
        _currentLocale = const Locale('am');
      } else {
        _currentLocale = const Locale('en');
      }
      widget.onLocaleChanged(_currentLocale);
      // Re-initialize the chatbot or fetch initial message in new locale
      _startNewChat();
    });
  }

  void _startNewChat() {
    setState(() {
      _chatBubbles.clear();
      _showInputField = true;
      _lastFollowUpMessage = null;
    });
    // Send an empty message to trigger the initial greeting in the new language
    context.read<ChatbotBloc>().add(
      StartChatEvent('', AppLocalizations.of(context)!.localeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded, // Modern back icon
            color: AppColors.primaryDeepBlue,
            size: 28,
          ),
          onPressed: () {
            context.go('/home');
          },
        ),
        title: Text(
          l10n.symptomCheckerTitle,
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.primaryDeepBlue,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightBackground,
        elevation: 2, // Added elevation for a more defined look
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocListener<ChatbotBloc, ChatbotState>(
              listener: (context, state) {
                if (state is ChatbotInitial) {
                  _lastFollowUpMessage = null;
                  _addBotMessage(l10n.symptomCheckerGreeting);
                } else if (state is FollowUpLoaded) {
                  final msg = state.message;

                  if (msg is FollowUpMessage) {
                    _lastFollowUpMessage = msg;
                    _addBotMessage(msg.question);
                  } else if (msg is GuideMessage) {
                    _lastFollowUpMessage = null;
                    setState(() {
                      _chatBubbles.add(GuidanceCard(guide: msg));
                      _showInputField = false;
                    });
                    _scrollToBottom();
                  }
                } else if (state is ChatbotError) {
                  _addBotMessage(state.message, isError: true);
                }
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                itemCount: _chatBubbles.length,
                itemBuilder: (context, index) => _chatBubbles[index],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _showInputField
                  ? _buildChatInputField(context, l10n)
                  : _buildStartNewChatButton(context, l10n),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '⚠️ Disclaimer: This chatbot is for informational purposes only and is not a substitute for medical advice.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTextGrey.copyWith(
                    fontSize: 11,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatInputField(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8), // Add margin for better spacing
      decoration: BoxDecoration(
        color: AppColors.lightPrimary,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Microphone icon
          Container(
            decoration: const BoxDecoration(
              color: AppColors.white, // A softer color for the mic background
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.mic_rounded, // Rounded mic icon
              color: AppColors.primaryDeepBlue,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization
                  .sentences, // Capitalize first letter of sentence
              decoration: InputDecoration(
                hintText: l10n.symptomCheckerHint,
                hintStyle: AppTextStyles.bodyTextGrey, // Consistent text style
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ), // Adjust padding
              ),
              onSubmitted: (value) =>
                  _sendMessage(value, context), // Send on enter
            ),
          ),
          // Send button
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryDeepBlue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded), // Rounded send icon
              color: AppColors.white,
              iconSize: 24,
              onPressed: () => _sendMessage(_controller.text.trim(), context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartNewChatButton(BuildContext context, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Consistent padding
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDeepBlue,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 50), // Full width button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Rounded button corners
          ),
          elevation: 5,
        ),
        onPressed: _startNewChat,
        child: Text(
          'Start new chat', // Localized text for button
          style: AppTextStyles.buttonText, // Consistent button text style
        ),
      ),
    );
  }
}
