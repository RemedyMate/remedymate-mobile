import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import '../../models/quick_action_model.dart';

part 'chatbot_event.dart';
part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  // The initial state is now the data-carrying ChatbotState
  ChatbotBloc() : super(const ChatbotState()) {
    // We register an event handler for loading the homepage data
    on<LoadHomePageData>(_onLoadHomePageData);
  }

  // This method contains the logic from your old HomeBloc
  Future<void> _onLoadHomePageData(
    LoadHomePageData event,
    Emitter<ChatbotState> emit,
  ) async {
    // This now loads data from the asset file, not hardcoded.
    final stringData = await rootBundle.loadString('assets/mock/chatbot_home_data.json');
    final jsonData = jsonDecode(stringData);

    /*final quickActions = (jsonData['quickActions'] as List).map((item) {
      IconData getIconForKey(String key) {
        switch (key) {
          case "quickActionSymptomsTitle":
            return Icons.medical_services_outlined;
          case "quickActionLibraryTitle":
            return Icons.inventory_2_outlined;
          case "quickActionSavedTitle":
            return Icons.chat_bubble_outline;
          case "quickActionEmergencyTitle":
            return Icons.warning_amber_rounded;
          default:
            return Icons.help_outline; // Fallback icon
        }
      }
      return QuickActionModel(
        title: item['titleKey'],
        subtitle: item['subtitleKey'],
        icon: getIconForKey(item['titleKey']),
      );
    }).toList(); */

    final popularTopics = List<String>.from(jsonData['popularTopics']);
    final localTips = List<String>.from(jsonData['localTips']);

    emit(state.copyWith(

      popularTopics: popularTopics,
      localTips: localTips,
    ));
  }
}