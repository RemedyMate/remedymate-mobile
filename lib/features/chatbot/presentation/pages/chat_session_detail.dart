import 'package:dartz/dartz.dart' hide State;
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
  const ChatSessionDetailPage({super.key});

  @override
  State<ChatSessionDetailPage> createState() => _ChatSessionDetailPageState();
}

class _ChatSessionDetailPageState extends State<ChatSessionDetailPage> {
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _chatBubbles = [];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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

  void _addBotMessage(String text, {bool isError = false}) {
    setState(() {
      _chatBubbles.add(BotMessage(text, isError: isError));
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
          onPressed: () => context.go('/chat_history'),
        ),
        title: Text(
          'History page', // Add this key in your ARB
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.primaryDeepBlue,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightBackground,
        elevation: 2,
      ),
      body: BlocConsumer<ChatbotBloc, ChatbotState>(
        listener: (context, state) {
          if (state is ChatbotError) {
            _addBotMessage(state.message, isError: true);
          }
        },
        builder: (context, state) {
          if (state is ConversationLoaded) {
            // Render saved conversation
            _chatBubbles.clear();
            for (final msg in state.messages) {
              if (msg is FollowUpAnswerMessage) {
                _chatBubbles.add(
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryDeepBlue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                      child: Text(
                        msg.answer,
                        style: AppTextStyles.bodyTextWhite,
                      ),
                    ),
                  ),
                );
              } else if (msg is FollowUpMessage) {
                _chatBubbles.add(BotMessage(msg.question));
              } else if (msg is GuideMessage) {
                _chatBubbles.add(GuidanceCard(guide: msg));
              }
            }
            _scrollToBottom();

            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              itemCount: _chatBubbles.length,
              itemBuilder: (context, index) => _chatBubbles[index],
            );
          } else if (state is ChatbotLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text(
                'No conversation selected',
                style: AppTextStyles.bodyTextGrey,
              ),
            );
          }
        },
      ),
    );
  }
}
