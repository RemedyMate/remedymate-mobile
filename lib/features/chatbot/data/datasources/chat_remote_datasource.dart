import 'package:dartz/dartz.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_exceptions.dart';
import '../../../../core/error/failures.dart';
import '../models/chat_message_model.dart';

abstract class ChatRemoteDatasource {
  Future<Either<Failure, ChatMessageModel>> startChat(
    String symptoms,
    String language,
  );
  Future<Either<Failure, ChatMessageModel>> answerFollowUp(
    FollowUpAnswerMessageModel message,
  );
}

class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  final ApiClient apiClient;

  ChatRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<Either<Failure, ChatMessageModel>> startChat(
    String symptoms,
    String language,
  ) async {
    try {
      final response = await apiClient.post('/conversation/', {
        'symptom': symptoms,
        'language': language,
      });
      return Right(ChatMessageModel.fromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatMessageModel>> answerFollowUp(
    FollowUpAnswerMessageModel message,
  ) async {
    try {
      final response = await apiClient.post('/conversation/', {
        'conversation_id': message.conversationId,
        'answer': message.answer,
        'language': message.language,
      });

      return Right(ChatMessageModel.fromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
