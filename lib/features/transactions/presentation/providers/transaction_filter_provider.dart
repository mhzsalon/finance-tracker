import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/features/dashboard/domain/usecase/get_dashboard_usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';

final providerOfTransactionFilterType =
    StateNotifierProvider.autoDispose<
      TransactionFilterNotifier,
      TransactionFilterParams
    >((ref) => TransactionFilterNotifier());

class TransactionFilterNotifier extends StateNotifier<TransactionFilterParams> {
  TransactionFilterNotifier() : super(TransactionFilterParams(limit: 10));

  void updateType(TransactionType? type) {
    state = state.copyWith(type: type);
  }

  void updateCategory(int? category) {
    state = state.copyWith(categoryId: category);
  }

  void updateDateRange(DateTime? dateFilter) {
    state = state.copyWith(dateFilter: dateFilter);
  }

  void reset() {
    state = const TransactionFilterParams(limit: 10);
  }
}
