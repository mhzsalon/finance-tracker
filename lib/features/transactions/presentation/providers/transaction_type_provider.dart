import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';

final providerOfTransactionType =
    StateNotifierProvider.autoDispose<TransactionTypeNotifier, TransactionType>(
      (ref) => TransactionTypeNotifier(TransactionType.income),
    );

class TransactionTypeNotifier extends StateNotifier<TransactionType> {
  TransactionTypeNotifier(super.state);

  void updateTab(TransactionType value) => state = value;

  void currentTab() => state;
}
