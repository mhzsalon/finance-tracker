import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/usecases/usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';

class ExportTransactionUsecase implements Usecase<void, void> {
  final TransactionRepository transactionRepository;

  ExportTransactionUsecase(this.transactionRepository);
  @override
  Future<Either<Failure, void>> call({void params}) {
    return transactionRepository.exportTransactions();
  }
}
