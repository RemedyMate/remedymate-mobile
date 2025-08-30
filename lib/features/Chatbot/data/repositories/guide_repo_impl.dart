import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/guide_entity.dart';
import '../../domain/repositories/guide_repo.dart';
import '../datasources/mock_datasources.dart';

class GuideRepositoryImpl implements GuideRepository {
  final GuideDataSource dataSource;

  GuideRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Either<GuideEntity, FollowUpMessage>>> startChat(String symptoms, String language) async {
    try {
      final result = await dataSource.fetchGuideCard();
      return result.fold(
        (guide) => Right(Left(guide.toEntity())),
        (question) => Right(Right(question))
        );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Either<GuideEntity, FollowUpMessage>>> answerFollowUp(String conversationId, String answer) async {
    try {
      final result = await dataSource.fetchGuideCard();
      return result.fold(
        (guide) => Right(Left(guide.toEntity())),
        (question) => Right(Right(question))
        );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
