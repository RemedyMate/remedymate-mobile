import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class StartChatUseCase {
  final ChatRepository repository;

  StartChatUseCase(this.repository);

  Future<Either<Failure, ChatMessage>> call(
    String symptoms,
    String language,
  ) async {
    final result = await repository.startChat(symptoms, language);
    return result;
  }
}
