import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/features/onboarding/data/source/local/onboarding_local_data_source.dart';
import 'package:universalexpensetracker/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnBoardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl(this.localDataSource);
  @override
  Future<Either<Failure, bool>> getAppPref() async {
    try {
      final result = await localDataSource.getAppPref();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setAppPref() async {
    try {
      await localDataSource.createAppPref();
      return Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
