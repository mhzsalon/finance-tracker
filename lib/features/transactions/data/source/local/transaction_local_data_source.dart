import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/core/helpers/app_logger.dart';
import 'package:universalexpensetracker/core/storage/hive_local_storage.dart';
import 'package:universalexpensetracker/features/transactions/data/model/transaction_model.dart';

abstract class TransactionLocalDataSource {
  Future<List<TransactionModel>> getTransactionList();
  Future<void> addTransaction(TransactionModel model);
  Stream<List<TransactionModel>> getTransactionStream();
}

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  final HiveLocalStorage storage;

  TransactionLocalDataSourceImpl(this.storage);
  @override
  Future<void> addTransaction(TransactionModel model) async {
    try {
      await storage.add(model.toJson());
    } catch (e, st) {
      AppLogger.error("Failed to add transaction", e, st);
      throw CacheException();
    }
  }

  @override
  Future<List<TransactionModel>> getTransactionList() async {
    try {
      final rawList = await storage.getAll();
      return rawList.map((json) => TransactionModel.fromJson(json)).toList();
    } catch (e, st) {
      AppLogger.error("Failed to get transaction", e, st);
      throw CacheException();
    }
  }

  @override
  Stream<List<TransactionModel>> getTransactionStream() {
    try {
      return storage.getStreamData().map((event) {
        return event.map((json) => TransactionModel.fromJson(json)).toList();
      });
    } catch (e, st) {
      AppLogger.error("Failed to get transaction stream", e, st);
      throw CacheException();
    }
  }
}
