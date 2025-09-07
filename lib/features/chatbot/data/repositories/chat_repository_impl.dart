import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_local_datasource.dart';
import '../datasources/chat_remote_datasource.dart';
import '../models/chat_message_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDatasource dataSource;
  final ChatLocalDatasource localDatasource;

  ChatRepositoryImpl(this.dataSource, this.localDatasource);

  @override
  Future<Either<Failure, ChatMessage>> startChat(
    String symptoms,
    String language,
  ) async {
    try {
      final result = await dataSource.startChat(symptoms, language);
      return result.fold((failure) => Left(failure), (message) async {
        
        // Save to local cache
        final model = FollowUpAnswerMessageModel(
          language: language,
          conversationId: message.conversationId,
          followUpId: '0',
          answer: symptoms,
          timestamp: message.timestamp,
        );
        await localDatasource.addMessage(message.conversationId, [model]);
        await localDatasource.addMessage(message.conversationId, [message]);

        return Right(message.toEntity());
      });
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
      return result.fold((failure) => Left(failure), (message) async {
        // Save to local cache
        
        await localDatasource.addMessage(message.conversationId, [model]);
        await localDatasource.addMessage(message.conversationId, [message]);
        return Right(message.toEntity());
      });
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<ChatMessage>> getConversation(String sessionId) async {
    final cached = await localDatasource.get(sessionId);
    return cached?.map((m) => m.toEntity()).toList() ?? [];
  }

  @override
  Future<List<List<ChatMessage>>> getAllConversations() async {
    
    final cached = await localDatasource.getAll();
    
    return cached
        .map((conversation) => conversation.map((m) => m.toEntity()).toList())
        .toList();
  }

  @override
  Future<void> clearAllSessions() {
    return localDatasource.clearAllSessions();
  }
}
