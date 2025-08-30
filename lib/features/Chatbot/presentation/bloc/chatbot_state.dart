part of 'chatbot_bloc.dart';

class ChatbotState extends Equatable {
  
  final List<String> popularTopics;
  final List<String> localTips;
  // You can add other state properties here  

  const ChatbotState({

    this.popularTopics = const [],
    this.localTips = const [],
  });

  ChatbotState copyWith({
    List<QuickActionModel>? quickActions,
    List<String>? popularTopics,
    List<String>? localTips,
  }) {
    return ChatbotState(
    
      popularTopics: popularTopics ?? this.popularTopics,
      localTips: localTips ?? this.localTips,
    );
  }

  @override
  List<Object?> get props => [ popularTopics, localTips];
}