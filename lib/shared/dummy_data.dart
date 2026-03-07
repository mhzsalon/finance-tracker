import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';

final List<TransactionEntity> krecentTransactions = [
  TransactionEntity(
    title: 'Salary Deposit',
    date: DateTime.now(),
    amount: 2200,
    type: TransactionType.income,
    id: "",
  ),
  TransactionEntity(
    id: "",
    title: 'Grocery Shopping',
    amount: 78,
    type: TransactionType.expenses,
    date: DateTime.now(),
  ),
  TransactionEntity(
    id: "",

    title: 'Travel Booking',
    amount: 430,
    type: TransactionType.expenses,
    date: DateTime.now(),
  ),
  TransactionEntity(
    id: "",

    title: 'Freelance Payment',
    amount: 900,
    type: TransactionType.income,
    date: DateTime.now(),
  ),
  TransactionEntity(
    id: "",

    title: 'Netflix Subscription',
    amount: 15,
    type: TransactionType.expenses,
    date: DateTime.now(),
  ),
];
