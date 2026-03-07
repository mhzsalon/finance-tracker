import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/features/dashboard/domain/usecase/get_dashboard_usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionEntity>>> getTransactionList();
  Future<Either<Failure, void>> addTransaction(TransactionParams params);
  Stream<Either<Failure, List<TransactionEntity>>> watchTransactions(
    TransactionFilterParams params,
  );
}
