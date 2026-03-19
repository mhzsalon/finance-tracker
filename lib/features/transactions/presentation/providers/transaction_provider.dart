import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/core/services/events/ui_event_provider.dart';
import 'package:universalexpensetracker/core/services/events/ui_events.dart';
import 'package:universalexpensetracker/features/dashboard/domain/usecase/get_dashboard_usecase.dart';
import 'package:universalexpensetracker/features/transactions/di/transactions_di.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/state/transaction_state.dart';

/// [Transactions Stream] provides streams of transactions
final streamProviderOfTransaction = StreamProvider<List<TransactionEntity>>((
  ref,
) {
  final useCase = ref.read(providerOfGetTransactionUsecase);
  final filterState = ref.watch(providerOfTransactionNotifier);

  // Transaction filter params
  final params = TransactionFilterParams(
    limit: filterState.limit,
    categoryId: filterState.categoryId,
    dateFilter: filterState.dateFilter,
    type: filterState.type,
  );

  return useCase(params: params).map(
    (either) =>
        either.fold((failure) => throw failure, (transactions) => transactions),
  );
});

///  Traansaction notifier [Add, Delete] transaction
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

  Future<void> exportTransaction() async {
    ref.read(uiEventProvider.notifier).state = ShowLoading(
      "Exporting transactions...",
    );

    final usecase = ref.read(providerOfExportTransactionUsecase);
    final result = await usecase();

    result.fold(
      (l) => ref.read(uiEventProvider.notifier).state = ShowError(l.message),
      (r) => ref.read(uiEventProvider.notifier).state = ShowSuccess(
        "Export Successful",
      ),
    );
  }

  void udateFilterValues({
    int? category,
    TransactionType? type,
    bool increaseLimit = false,
    DateTime? dateFilter,
  }) {
    if (increaseLimit) {
      state = state.copyWith(limit: state.limit + 10);
    } else {
      state = state.copyWith(
        categoryId: category,
        dateFilter: dateFilter,
        limit: 10,
        type: type,
      );
    }
  }

  void resetFilters() {
    state = state.copyWith(
      categoryId: null,
      dateFilter: null,
      limit: 10,
      type: null,
    );
  }
}
