import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/l10n/arb/app_localizations.dart';
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
  String language = 'EN ↔ Ahm';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.appBarColor,
          title: Row(
            children: [
              // Back arrow
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.drawerTextColor),
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
                child: const Icon(Icons.check, color: AppColors.primaryDeepBlue)
              ),
              const SizedBox(width: 6),
              // Title
              Text(
                AppLocalizations.of(context)!.symptomChecker,
                style: const TextStyle(color: AppColors.drawerTextColor, fontSize: 20),
              ),

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
                    style: const TextStyle(color: AppColors.drawerTextColor, fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // EN <-> AM button (smaller)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryDeepBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: () {
                    toggleLanguage();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(40, 20),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.enAmToggle,
                    style: const TextStyle(color: AppColors.drawerBackground, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      body: Container(
        color: AppColors.background,
        child: Column(
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
              child: BlocBuilder<ChatbotBloc, ChatbotState>(
                builder: (context, state) {
                  if (state is ChatbotInitial) {
                    return BotMessage(
                      AppLocalizations.of(context)!.welcomeMessage,
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
              decoration: const BoxDecoration(
                border: Border(top:BorderSide(color: AppColors.border)),
              ),
              child: Column(
                children: [
                  Wrap(
                    spacing: 8,
                    children: [
                      QuickChip(AppLocalizations.of(context)!.quickChipToday, controller: _controller),
                      QuickChip(AppLocalizations.of(context)!.quickChipYesterday, controller: _controller),
                      QuickChip(AppLocalizations.of(context)!.quickChipOneWeek, controller: _controller),
                      QuickChip(AppLocalizations.of(context)!.quickChipSeverePain, controller: _controller),
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
                            hintText: AppLocalizations.of(context)!.typeYourMessage,
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
                        backgroundColor: AppColors.greenTriage,
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
