import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_datasource.dart';
import '../models/chat_message_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDatasource dataSource;

  ChatRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, ChatMessage>> startChat(
    String symptoms,
    String language,
  ) async {
    try {
      final result = await dataSource.startChat(symptoms, language);
      return result.fold(
        (failure) => Left(failure),
        (message) => Right(message.toEntity()),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatMessage>> answerFollowUp(
    FollowUpAnswerMessage message,
  ) async {
    try {
      final model = FollowUpAnswerMessageModel(
        language: message.language,
        conversationId: message.conversationId,
        followUpId: message.followUpId,
        answer: message.answer,
        timestamp: message.timestamp,
      );
      final result = await dataSource.answerFollowUp(model);
      return result.fold(
        (failure) => Left(failure),
        (message) => Right(message.toEntity()),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, List<OfflineTopicEntity>>> fetchTopics() async {
  //   try {
  //     final topics = await dataSource.fetchTopics();
  //     return Right(topics);
  //   } on Exception {
  //     return const Left(ServerFailure('server failure'));
  //   } 
  // }

}
