import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:universalexpensetracker/core/storage/hive_local_storage.dart';
import 'package:universalexpensetracker/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:universalexpensetracker/features/transactions/data/source/local/transaction_local_data_source.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/get_transaction_usecase.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/state/transaction_state.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/transaction_provider.dart';

final transactionBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError('Transaction box not initialized');
});

final transactionStorageProvider = Provider<HiveLocalStorage>(
  (ref) => HiveLocalStorage(ref.watch(transactionBoxProvider)),
);

final providerOfTransactionLocalDataSource =
    Provider<TransactionLocalDataSource>(
      (ref) =>
          TransactionLocalDataSourceImpl(ref.read(transactionStorageProvider)),
    );

final providerOfTransactionRepository = Provider<TransactionRepository>(
  (ref) =>
      TransactionRepositoryImpl(ref.read(providerOfTransactionLocalDataSource)),
);

final providerOfGetTransactionUsecase = Provider<GetTransactionUsecase>(
  (ref) => GetTransactionUsecase(ref.read(providerOfTransactionRepository)),
);

final providerOfAddTransactionUsecase = Provider<AddTransactionUsecase>(
  (ref) => AddTransactionUsecase(ref.read(providerOfTransactionRepository)),
);

final providerOfTransactionNotifier =
    StateNotifierProvider<TransactionNotifier, TransactionState>(
      (ref) => TransactionNotifier(ref: ref, state: TransactionState()),
    );
