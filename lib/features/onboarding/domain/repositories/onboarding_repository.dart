import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure, bool>> getAppPref();
  Future<Either<Failure, void>> setAppPref();
}
