import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/helpers/uuid_generator.dart';
import 'package:universalexpensetracker/features/dashboard/domain/usecase/get_dashboard_usecase.dart';
import 'package:universalexpensetracker/features/transactions/data/model/transaction_model.dart';
import 'package:universalexpensetracker/features/transactions/data/source/local/transaction_local_data_source.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource localDataSource;

  TransactionRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> addTransaction(TransactionParams params) async {
    try {
      final model = TransactionModel(
        id: generateUuid(),
        amount: params.amount,
        type: params.type.name,
        categoryId: params.categoryId,
        date: params.date,
        title: params.title,
      );

      await localDataSource.addTransaction(model);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactionList() async {
    try {
      final transactions = await localDataSource.getTransactionList();
      return Right(transactions.map((e) => e.toEntity()).toList());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Stream<Either<Failure, List<TransactionEntity>>> watchTransactions(
    TransactionFilterParams params,
  ) async* {
    try {
      yield* localDataSource.getTransactionStream().map((models) {
        final filtered = _applyFilters(models, params);
        final entities = filtered.map((e) => e.toEntity()).toList();
        return Right<Failure, List<TransactionEntity>>(entities);
      });
    } catch (e) {
      yield Left(CacheFailure());
    }
  }

  List<TransactionModel> _applyFilters(
    List<TransactionModel> models,
    TransactionFilterParams params,
  ) {
    var result = models;

    if (params.type != null) {
      result = result.where((m) => m.type == params.type!.name).toList();
    }

    if (params.categoryId != null) {
      result = result.where((m) => m.categoryId == params.categoryId).toList();
    }
    if (params.dateFilter != null) {
      result = result.where((m) {
        return m.date.month == params.dateFilter!.month &&
            m.date.year == params.dateFilter!.year;
      }).toList();
    }

    return result;
  }
}
