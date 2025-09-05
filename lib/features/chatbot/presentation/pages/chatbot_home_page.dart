import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/l10n/arb/app_localizations.dart';
import '../bloc/chatbot_bloc.dart';
import '../widget/disclaimer_widget.dart';
import '../widget/emergency_pop_up.dart';
import '../widget/home_header.dart';
import '../widget/quick_access_card.dart';

class ChatbotHomePage extends StatelessWidget {
  const ChatbotHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<ChatbotBloc, ChatbotState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  height: 250,
                  child: Lottie.asset(
                    'assets/lottie/home_file.json',
                    fit: BoxFit.contain,
                    repeat: true, // Keeps animating
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      Text(
                        l10n.homeTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.sectionHeader.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.homeSubtitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.cardSubtitle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.mic_none,
                                color: AppColors.primaryDeepBlue,
                                size: 20,
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryDeepBlue,
                              foregroundColor: AppColors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 48,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              textStyle: AppTextStyles.bodyText.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text(l10n.startChat),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                const SizedBox(height: 16),
                Text(l10n.quickAccessTitle, style: AppTextStyles.sectionHeader),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                  children: [
                    QuickAccessCard(
                      title: l10n.quickActionSymptomsTitle,
                      subtitle: l10n.quickActionSymptomsSubtitle,
                      icon: Icons.medical_services_outlined,
                      iconContainerColor: AppColors.background,
                      iconColor: AppColors.redTriage,
                      onTap: () {
                        Navigator.pushNamed(context, '/symptom_checker');
                      },
                    ),
                    QuickAccessCard(
                      title: l10n.quickActionLibraryTitle,
                      subtitle: l10n.quickActionLibrarySubtitle,
                      icon: Icons.inventory_2_outlined,
                      iconContainerColor: AppColors.background,
                      iconColor: const Color(0xff1565C0),
                      onTap: () {},
                    ),
                    QuickAccessCard(
                      title: l10n.quickActionSavedTitle,
                      subtitle: l10n.quickActionSavedSubtitle,
                      icon: Icons.chat_bubble_outline,
                      iconContainerColor: AppColors.background,
                      iconColor: AppColors.greenTriage,
                      onTap: () {
                        context.go('/chat_sessions');
                      },
                    ),
                    QuickAccessCard(
                      title: l10n.quickActionEmergencyTitle,
                      subtitle: l10n.quickActionEmergencySubtitle,
                      icon: Icons.warning_amber_rounded,
                      cardColor: AppColors.emergencyRedLight.withValues(
                        alpha: 0.4,
                      ),
                      iconContainerColor: AppColors.redTriage,
                      iconColor: AppColors.white,
                      titleColor: AppColors.redTriage,
                      subtitleColor: AppColors.redTriage.withValues(alpha: 0.8),
                      onTap: () {
                        EmergencyModal.show(context);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const DisclaimerWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
