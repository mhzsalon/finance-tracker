import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/usecases/usecase.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';

class AddTransactionUsecase implements Usecase<void, TransactionParams> {
  final TransactionRepository transactionRepository;

  AddTransactionUsecase(this.transactionRepository);
  @override
  Future<Either<Failure, void>> call({required TransactionParams params}) {
    return transactionRepository.addTransaction(params);
  }
}

class TransactionParams extends Equatable {
  final double amount;
  final TransactionType type;
  final int? categoryId;
  final DateTime date;
  final String title;

  const TransactionParams({
    required this.amount,
    required this.type,
    this.categoryId,
    required this.title,
    required this.date,
  });

  @override
  List<Object?> get props => [amount, type, categoryId, date, title];
}
