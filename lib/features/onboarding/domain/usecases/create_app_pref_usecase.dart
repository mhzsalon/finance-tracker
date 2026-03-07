import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/usecases/usecase.dart';
import 'package:universalexpensetracker/features/onboarding/domain/repositories/onboarding_repository.dart';

class CreateAppPrefUsecase extends Usecase<void, void> {
  final OnBoardingRepository onBoardingRepository;

  CreateAppPrefUsecase(this.onBoardingRepository);
  @override
  Future<Either<Failure, void>> call({void params}) {
    return onBoardingRepository.setAppPref();
  }
}
