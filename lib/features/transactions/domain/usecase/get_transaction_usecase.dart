import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/usecases/usecase.dart';
import 'package:universalexpensetracker/features/dashboard/domain/usecase/get_dashboard_usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';

class GetTransactionUsecase
    implements StreamUsecase<List<TransactionEntity>, TransactionFilterParams> {
  final TransactionRepository transactionRepository;

  GetTransactionUsecase(this.transactionRepository);
  @override
  Stream<Either<Failure, List<TransactionEntity>>> call({
    required TransactionFilterParams params,
  }) {
    return transactionRepository.watchTransactions(params);
  }
}
