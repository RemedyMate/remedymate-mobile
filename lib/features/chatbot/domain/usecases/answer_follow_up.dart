import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class AnswerFollowUpUseCase {
  final ChatRepository repository;

  AnswerFollowUpUseCase(this.repository);

  Future<Either<Failure, ChatMessage>> call(
    FollowUpAnswerMessage message,
  ) async {
    return await repository.answerFollowUp(message);
  }
}
