import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class GetConversation {
  final ChatRepository repository;

  GetConversation(this.repository);

  Future<Either<Failure, List<ChatMessage>>> call(String sessionId) async {
    try {
      final messages = await repository.getConversation(sessionId);
      return Right(messages);
    } catch (e) {
      return Left(ServerFailure('Failed to get conversation: ${e.toString()}'));
    }
  }
}
