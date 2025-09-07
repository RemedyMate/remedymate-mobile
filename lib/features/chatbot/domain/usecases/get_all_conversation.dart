import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class GetAllConversations {
  final ChatRepository repository;

  GetAllConversations(this.repository);

  Future<Either<Failure, List<List<ChatMessage>>>> call() async {
    try {
      final conversations = await repository.getAllConversations();
      return Right(conversations);
    } catch (e) {
      return Left(
        ServerFailure('Failed to get all conversations: ${e.toString()}'),
      );
    }
  }
}
