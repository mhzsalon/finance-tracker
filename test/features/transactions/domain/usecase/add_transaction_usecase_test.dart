import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';

class MockExpenseRepository extends Mock implements TransactionRepository {}

void main() {
  late AddTransactionUsecase usecase;
  late MockExpenseRepository mockExpenseRepository;
  setUp(() {
    mockExpenseRepository = MockExpenseRepository();
    usecase = AddTransactionUsecase(mockExpenseRepository);
  });

  group("Add Transaction-", () {
    final tSuccess = "Test Success";
    test('should return Success on add expenses', () async {
      final tExpenseParams = TransactionParams(
        amount: 200,
        type: TransactionType.expenses,
        categoryId: 2,
      );
      //Arrange
      when(
        () => mockExpenseRepository.addTransaction(tExpenseParams),
      ).thenAnswer((_) async => Right(tSuccess));

      //Act
      final result = await usecase.call(params: tExpenseParams);

      //Assert
      expect(result, equals(Right(tSuccess)));
      verify(() => mockExpenseRepository.addTransaction(tExpenseParams));
    });

    test('should return Success on add income', () async {
      final tTransactionParams = TransactionParams(
        amount: 200,
        type: TransactionType.income,
      );
      //Arrange
      when(
        () => mockExpenseRepository.addTransaction(tTransactionParams),
      ).thenAnswer((_) async => Right(tSuccess));

      //Act
      final result = await usecase.call(params: tTransactionParams);

      //Assert
      expect(result, equals(Right(tSuccess)));
      verify(() => mockExpenseRepository.addTransaction(tTransactionParams));
    });

    // test('should return CacheFailure while getting expenses list', () async {
    //   //Arrange
    //   when(
    //     mockExpenseRepository.getExpenseList,
    //   ).thenAnswer((_) async => Left(CacheFailure()));

    //   //Act
    //   final result = await usecase.call();

    //   //Assert
    //   expect(result, equals(Left(CacheFailure())));
    //   verify(mockExpenseRepository.getExpenseList);
    // });
  });
}
