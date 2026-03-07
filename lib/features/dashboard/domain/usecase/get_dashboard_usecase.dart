import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/usecases/usecase.dart';
import 'package:universalexpensetracker/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';

class GetDashboardUsecase implements StreamUsecase<DashboardEntity, void> {
  final TransactionRepository transactionRepository;

  GetDashboardUsecase(this.transactionRepository);

  @override
  Stream<Either<Failure, DashboardEntity>> call({void params}) async* {
    yield* transactionRepository
        .watchTransactions(
          TransactionFilterParams(
            categoryId: null,
            dateFilter: null,
            type: null,
          ),
        )
        .map((either) {
          print(either);
          return either.fold((failure) => Left(failure), (transactions) {
            print(transactions);
            final totalIncome = transactions
                .where((t) => t.type == TransactionType.income)
                .fold<double>(0, (sum, t) => sum + t.amount);

            final totalExpense = transactions
                .where((t) => t.type == TransactionType.expenses)
                .fold<double>(0, (sum, t) => sum + t.amount);

            final recentTransactions = transactions.take(5).toList();

            return Right(
              DashboardEntity(
                totalIncome: totalIncome,
                totalExpense: totalExpense,
                recentTransactions: recentTransactions,
              ),
            );
          });
        });

    // await for (final either in transactionRepository.watchTransactions(
    //   TransactionFilterParams(categoryId: null, dateFilter: null, type: null),
    // )) {
    //   yield either.fold((failure) => Left(failure), (transactions) {
    //     print(transactions);
    //     final totalIncome = transactions
    //         .where((t) => t.type == TransactionType.income)
    //         .fold<double>(0, (sum, t) => sum + t.amount);

    //     final totalExpense = transactions
    //         .where((t) => t.type == TransactionType.expenses)
    //         .fold<double>(0, (sum, t) => sum + t.amount);

    //     final recentTransactions = transactions.take(5).toList();

    //     return Right(
    //       DashboardEntity(
    //         totalIncome: totalIncome,
    //         totalExpense: totalExpense,
    //         recentTransactions: recentTransactions,
    //       ),
    //     );
    //   });

    // }
  }
}

class TransactionFilterParams extends Equatable {
  final TransactionType? type;
  final int? categoryId;
  final DateTime? dateFilter;
  const TransactionFilterParams({this.type, this.categoryId, this.dateFilter});

  @override
  // TODO: implement props
  List<Object?> get props => [type, categoryId, dateFilter];
}
