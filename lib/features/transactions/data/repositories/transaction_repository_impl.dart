import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/helpers/app_logger.dart';
import 'package:universalexpensetracker/core/helpers/uuid_generator.dart';
import 'package:universalexpensetracker/core/services/export/data_exporter.dart';
import 'package:universalexpensetracker/features/dashboard/domain/usecase/get_dashboard_usecase.dart';
import 'package:universalexpensetracker/features/transactions/data/model/transaction_model.dart';
import 'package:universalexpensetracker/features/transactions/data/source/local/transaction_local_data_source.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource localDataSource;
  final DataExporter exporter;

  TransactionRepositoryImpl(this.localDataSource, this.exporter);

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
      return const Right(null);
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

    result = result.reversed.toList();

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
    if (params.limit != 0) {
      result = result.take(params.limit).toList();
    }

    return result;
  }

  @override
  Future<Either<Failure, void>> exportTransactions() async {
    try {
      final transactions = await localDataSource.getTransactionList();
      await exporter.export(
        fileName: "transactions",
        headers: ["ID", "Date", "Title", "Amount", "Type", "Category"],
        rows: transactions.map((t) {
          return [t.id, t.date, t.title, t.amount, t.type, t.categoryId];
        }).toList(),
      );
      return const Right(null);
    } on ExportException catch (e, st) {
      AppLogger.error("Export Error", e, st);
      return Left(ExportFailure(e.message));
    } catch (e, st) {
      AppLogger.error("Export Error", e, st);
      return Left(ExportFailure("Unexpected export error"));
    }
  }
}
