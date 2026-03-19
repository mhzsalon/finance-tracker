import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:universalexpensetracker/core/services/export/data_exporter_di.dart';
import 'package:universalexpensetracker/core/storage/hive_local_storage.dart';
import 'package:universalexpensetracker/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:universalexpensetracker/features/transactions/data/source/local/transaction_local_data_source.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/export_transaction_usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/get_transaction_usecase.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/state/transaction_state.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/transaction_provider.dart';

final transactionBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError('Transaction box not initialized');
});

final transactionStorageProvider = Provider<HiveLocalStorage>(
  (ref) => HiveLocalStorage(ref.watch(transactionBoxProvider)),
);

/// [Transaction local data source]
final providerOfTransactionLocalDataSource =
    Provider<TransactionLocalDataSource>(
      (ref) =>
          TransactionLocalDataSourceImpl(ref.read(transactionStorageProvider)),
    );

/// [Transaction repository]
final providerOfTransactionRepository = Provider<TransactionRepository>(
  (ref) => TransactionRepositoryImpl(
    ref.read(
      providerOfTransactionLocalDataSource,
    ), // Trnsaction local data source
    ref.read(providerOfExcelExporter), // Excel Exporter
  ),
);

///[Usecases]
final providerOfGetTransactionUsecase = Provider<GetTransactionUsecase>(
  (ref) => GetTransactionUsecase(ref.read(providerOfTransactionRepository)),
);

final providerOfAddTransactionUsecase = Provider<AddTransactionUsecase>(
  (ref) => AddTransactionUsecase(ref.read(providerOfTransactionRepository)),
);

final providerOfExportTransactionUsecase = Provider<ExportTransactionUsecase>(
  (ref) => ExportTransactionUsecase(ref.read(providerOfTransactionRepository)),
);

/// [Providers]
final providerOfTransactionNotifier =
    StateNotifierProvider.autoDispose<TransactionNotifier, TransactionState>(
      (ref) => TransactionNotifier(ref: ref, state: TransactionState()),
    );
