import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/chat_repository.dart';

class ClearSession {
  final ChatRepository repository;

  ClearSession(this.repository);

  Future<Either<Failure, void>> call() async {
    try {
      await repository.clearAllSessions();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to clear sessions: ${e.toString()}'));
    }
  }
}
