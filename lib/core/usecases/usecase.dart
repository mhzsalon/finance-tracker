import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:universalexpensetracker/core/error/failures.dart';

abstract class Usecase<T, Params> {
  Future<Either<Failure, T>> call({required Params params});
}

abstract class StreamUsecase<T, Params> {
  Stream<Either<Failure, T>> call({required Params params});
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
