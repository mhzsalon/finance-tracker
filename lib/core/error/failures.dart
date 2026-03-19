import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  String get message => "Cache error occurred";
}

class ExportFailure extends Failure {
  final String errorMessage;

  ExportFailure(this.errorMessage);

  @override
  String get message => errorMessage;
}
