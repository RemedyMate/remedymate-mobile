import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatMessage>> startChat(
    String symptoms,
    String language,
  );
  Future<Either<Failure, ChatMessage>> answerFollowUp(
    FollowUpAnswerMessage message,
  );

  // Future<Either<Failure, List<OfflineTopicEntity>>> fetchTopics();
}
