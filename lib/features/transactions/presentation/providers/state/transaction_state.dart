import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universalexpensetracker/core/error/failures.dart';

part 'transaction_state.freezed.dart';

@freezed
abstract class TransactionState with _$TransactionState {
  factory TransactionState({
    /// The state of the reels feed.
    @Default(CreateTransactionState.initial())
    final CreateTransactionState createTransactionState,
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
