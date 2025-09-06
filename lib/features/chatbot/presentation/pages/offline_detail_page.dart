import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/chat_message.dart';
import '../bloc/chatbot_bloc.dart';
import '../widget/guide_card.dart';

class OfflineLibraryDetailPage extends StatelessWidget {
  const OfflineLibraryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatbotBloc, ChatbotState>(
      builder: (context, state) {
        if (state is LoadedOfflineLibrary){
           return Scaffold(
            appBar: AppBar(title: Text(state.guide.timestamp as String),),
            body: GuidanceCard(guide: state.guide as GuideMessage)
            );
        }
        else if(state is ChatbotError){
          return Center(child: Text(state.message),);
        }
        else{
          return const Center();
        }
      },
    );
   
  }
}



