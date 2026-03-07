import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/get_transaction_usecase.dart';

class MockExpenseRepository extends Mock implements TransactionRepository {}

void main() {
  late GetTransactionUsecase usecase;
  late MockExpenseRepository mockExpenseRepository;
  setUp(() {
    mockExpenseRepository = MockExpenseRepository();
    usecase = GetTransactionUsecase(mockExpenseRepository);
  });

  group("Get transaction list-", () {
    test('should get transaction list from repository', () async {
      final List<TransactionEntity> tTransactionList = [];
      //Arrange
      when(
        mockExpenseRepository.getTransactionList,
      ).thenAnswer((_) async => Right(tTransactionList));

      //Act
      final result = await usecase.call();

      //Assert
      expect(result, equals(Right(tTransactionList)));
      verify(mockExpenseRepository.getTransactionList);
    });

    test('should return CacheFailure while getting transaction list', () async {
      //Arrange
      when(
        mockExpenseRepository.getTransactionList,
      ).thenAnswer((_) async => Left(CacheFailure()));

      //Act
      final result = await usecase.call();

      //Assert
      expect(result, equals(Left(CacheFailure())));
      verify(mockExpenseRepository.getTransactionList);
    });
  });
}
