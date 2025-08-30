import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/guide_entity.dart';
import '../../domain/usecases/get_guide_card.dart';

part 'chatbot_event.dart';
part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  final StartChatUseCase startChatUseCase;

  ChatbotBloc({required this.startChatUseCase}) : super(ChatbotInitial()) {
    on<StartChatEvent>(_onGetGuidanceCard);
  }

  Future<void> _onGetGuidanceCard(
      StartChatEvent event, Emitter<ChatbotState> emit) async {
    emit(ChatbotLoading());

    final result = await startChatUseCase(event.symptoms, event.language);

    result.fold(
      (failure) => emit(ChatbotError(failure.message)),
      (guide) =>
        guide.fold(
          (guideEntity) => emit(GuideLoaded(guideEntity)),
          (followUpMessage) => emit(FollowUpLoaded(followUpMessage.question, followUpMessage.conversationId)),
        )
    );
  }
}
