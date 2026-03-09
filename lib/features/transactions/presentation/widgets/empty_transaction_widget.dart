import 'package:flutter/material.dart';
import 'package:universalexpensetracker/core/utils/navigation.dart';
import 'package:universalexpensetracker/core/widgets/states/empty_state.dart';
import 'package:universalexpensetracker/features/transactions/presentation/screen/add_transaction_screen.dart';

class EmptyTransactionWidget extends StatelessWidget {
  const EmptyTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.receipt_long_rounded,
      title: 'No transactions yet',
      description:
          'Start tracking your finances by adding your first transaction.',
      actionLabel: 'Add Transaction',
      onAction: () => Navigation.push(context, AddTransactionScreen()),
    );
  }
}
