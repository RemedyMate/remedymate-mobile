import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/guide_entity.dart';

abstract class GuideRepository {
  Future<Either<Failure, Either<GuideEntity, FollowUpMessage>>> startChat(String symptoms, String language);
  Future<Either<Failure, Either<GuideEntity, FollowUpMessage>>> answerFollowUp(String conversationId, String answer);
}