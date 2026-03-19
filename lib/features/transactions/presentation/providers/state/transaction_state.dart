import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';

part 'transaction_state.freezed.dart';

@freezed
abstract class TransactionState with _$TransactionState {
  factory TransactionState({
    @Default(CreateTransactionState.initial())
    final CreateTransactionState createTransactionState,
    @Default(TransactionExportState.initial())
    final TransactionExportState transactionExportState,

    // Filter oprions States
    final TransactionType? type,
    final int? categoryId,
    final DateTime? dateFilter,
    @Default(10) final int limit,
  }) = _TransactionState;
}

@freezed
class CreateTransactionState with _$CreateTransactionState {
  const factory CreateTransactionState.initial() =
      _CreateTransactionStateInitial;
  const factory CreateTransactionState.loading() =
      _CreateTransactionStateLoading;
  const factory CreateTransactionState.success(final String success) =
      _CreateTransactionStateSuccess;
  const factory CreateTransactionState.error(final Failure failure) =
      _CreateTransactionStateError;
}

@freezed
class TransactionExportState with _$TransactionExportState {
  const factory TransactionExportState.initial() =
      _TransactionExportStateInitial;
  const factory TransactionExportState.loading() =
      _TransactionExportStateLoading;
  const factory TransactionExportState.success() =
      _TransactionExportStateSuccess;
  const factory TransactionExportState.error(final Failure failure) =
      _TransactionExportStateError;
}
