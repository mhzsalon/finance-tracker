import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/features/transactions/di/transactions_di.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/state/transaction_state.dart';

class TransactionNotifier extends StateNotifier<TransactionState> {
  final Ref ref;

  TransactionNotifier({required this.ref, required TransactionState state})
    : super(state);

  Future<void> createTransaction(TransactionParams params) async {
    state = state.copyWith(
      createTransactionState: CreateTransactionState.loading(),
    );
    final usecase = ref.read(providerOfAddTransactionUsecase);
    final result = await usecase(params: params);

    result.fold(
      (l) => state = state.copyWith(
        createTransactionState: CreateTransactionState.error(l),
      ),
      (r) => state = state.copyWith(
        createTransactionState: CreateTransactionState.success(
          "Transaction added successfully.",
        ),
      ),
    );
  }
}
