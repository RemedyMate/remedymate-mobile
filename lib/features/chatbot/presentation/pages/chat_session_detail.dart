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

class ChatSessionDetailPage extends StatefulWidget {
  final String conversationId;
  const ChatSessionDetailPage({super.key, required this.conversationId});

  @override
  State<ChatSessionDetailPage> createState() => _ChatSessionDetailPageState();
}

class _ChatSessionDetailPageState extends State<ChatSessionDetailPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _chatBubbles = [];

  FollowUpMessage? _lastFollowUpMessage;
  bool _showInputField = true;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<ChatbotBloc>().add(LoadConversation(widget.conversationId));
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
    } else {
      context.read<ChatbotBloc>().add(StartChatEvent(input, l10n.localeName));
    }
  }

  void _addBotMessage(
    String heading,
    String subHeading,
    String text, {
    bool isError = false,
  }) {
    setState(() {
      _chatBubbles.add(
        BotMessage(
          heading: heading,
          subheading: subHeading,
          question: text,
          isError: isError,
        ),
      );
    });
    _scrollToBottom();
  }

  void _addUserMessage(String text) {
    setState(() {
      _chatBubbles.add(
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: const BoxDecoration(
              color: AppColors.primaryDeepBlue,
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

  void _startNewChat() {
    context.go('/chat');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primaryDeepBlue,
            size: 28,
          ),
          onPressed: () => context.go('/chat_sessions'),
        ),
        title: Text(
          'History page', // TODO: localize
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.primaryDeepBlue,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightBackground,
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatbotBloc, ChatbotState>(
              listener: (context, state) {
                if (state is ConversationLoaded) {
                  _chatBubbles.clear();
                  for (final msg in state.messages) {
                    if (msg is FollowUpAnswerMessage) {
                      _addUserMessage(msg.answer);
                    } else if (msg is FollowUpMessage) {
                      _lastFollowUpMessage = msg;
                      _addBotMessage(msg.heading, msg.subHeading, msg.question);
                    } else if (msg is GuideMessage) {
                      _lastFollowUpMessage = null;
                      setState(() {
                        _chatBubbles.add(GuidanceCard(guide: msg));
                        _showInputField = false;
                      });
                    }
                  }
                  _scrollToBottom();
                } else if (state is FollowUpLoaded) {
                  final msg = state.message;

                  if (msg is FollowUpMessage) {
                    _lastFollowUpMessage = msg;
                    _addBotMessage(msg.heading, msg.subHeading, msg.question);
                  } else if (msg is GuideMessage) {
                    _lastFollowUpMessage = null;
                    setState(() {
                      _chatBubbles.add(GuidanceCard(guide: msg));
                      _showInputField = false;
                    });
                    _scrollToBottom();
                  }
                } else if (state is ChatbotError) {
                  _addBotMessage('', '', state.message, isError: true);
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  itemCount: _chatBubbles.length,
                  itemBuilder: (context, index) => _chatBubbles[index],
                );
              },
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
      margin: const EdgeInsets.all(8),
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
          Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.mic_rounded,
              color: AppColors.primaryDeepBlue,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: l10n.symptomCheckerHint,
                hintStyle: AppTextStyles.bodyTextGrey,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              ),
              onSubmitted: (value) => _sendMessage(value, context),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryDeepBlue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded),
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
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDeepBlue,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 5,
        ),
        onPressed: _startNewChat,
        child: Text('Start new chat', style: AppTextStyles.buttonText),
      ),
    );
  }
}
