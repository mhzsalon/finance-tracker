import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/usecases/usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';

class GetTransactionUsecase implements Usecase<List<TransactionEntity>, void> {
  final TransactionRepository transactionRepository;

  GetTransactionUsecase(this.transactionRepository);
  @override
  Future<Either<Failure, List<TransactionEntity>>> call({void params}) {
    return transactionRepository.getTransactionList();
  }
}
