import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/usecases/usecase.dart';
import 'package:universalexpensetracker/features/onboarding/domain/repositories/onboarding_repository.dart';

class GetAppPrefUsecase extends Usecase<bool, void> {
  final OnBoardingRepository onBoardingRepository;

  GetAppPrefUsecase(this.onBoardingRepository);
  @override
  Future<Either<Failure, bool>> call({void params}) {
    return onBoardingRepository.getAppPref();
  }
}
