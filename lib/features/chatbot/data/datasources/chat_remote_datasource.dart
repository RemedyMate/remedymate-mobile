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
  // Future<List<OfflineTopicEntity>> fetchTopics();
}

class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  // final http.Client httpClient;
  final ApiClient apiClient;

  ChatRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<Either<Failure, ChatMessageModel>> startChat(
    String symptoms,
    String language,
  ) async {
    print('Starting chat with symptoms: $symptoms, language: $language');
    try {
      final response = await apiClient.post('/conversation/', {
        'symptom': symptoms,
        'language': language,
      });
      print(
        '++++++++++++++++++++ the response is here +++++++++++++++++= $response',
      );
      return Right(ChatMessageModel.fromJson(response));
    } on ApiException catch (e) {
      print('here getting error: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      print('++++++++++++++++++++ the error is here +++++++++++++++++=');
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

// @override
// Future<List<OfflineTopicEntity>> fetchTopics() async {
//   try {
//     final response = await httpClient.get(Uri.parse('https://remedymate-backend.onrender.com/api/v1/conversation/offline-topics'));
//     if (response.statusCode == 200) {
//         final List<dynamic> jsonData = json.decode(response.body);
//         return jsonData.map((item) => OfflineTopicModel.fromJson(item)).toList();
//       } else {
//         throw Exception('Failed to load offline topics: ${response.statusCode}');
//       }
//     } catch (e) {
//       print(e);
//       throw Exception('Failed to fetch offline topics: $e');
//     }
//   }
}
