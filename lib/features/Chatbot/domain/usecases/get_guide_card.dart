import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/bloc/chatbot_bloc.dart';
import '../entities/guide_entity.dart';
import '../repositories/guide_repo.dart';

class StartChatUseCase {
  final GuideRepository repository;

  StartChatUseCase(this.repository);

  Future<Either<Failure, Either<GuideEntity, FollowUpMessage>>> call(String symptoms, String language) async {
    return await repository.startChat(symptoms, language);
  }
}