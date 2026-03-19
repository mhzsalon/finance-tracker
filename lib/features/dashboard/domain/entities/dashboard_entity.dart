import 'package:equatable/equatable.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';

class DashboardEntity extends Equatable {
  final double totalIncome;
  final double totalExpense;
  final double totalAmount;
  final List<TransactionEntity> recentTransactions;

  const DashboardEntity({
    required this.totalIncome,
    required this.totalExpense,
    required this.recentTransactions,
    required this.totalAmount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    totalExpense,
    totalIncome,
    recentTransactions,
    totalAmount,
  ];
}
