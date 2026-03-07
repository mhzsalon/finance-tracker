import 'package:equatable/equatable.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';

class TransactionEntity extends Equatable {
  final String id;
  final double amount;
  final TransactionType type; // income | expense
  final int? categoryId; // required for expense, optional for income
  final DateTime date;
  final String title;

  const TransactionEntity({
    required this.id,
    required this.amount,
    required this.type,
    this.categoryId,
    required this.date,
    required this.title,
  });

  @override
  List<Object?> get props => [id, amount, type, categoryId, date, title];
}
