import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universalexpensetracker/features/transactions/data/model/transaction_model.dart';
import 'package:universalexpensetracker/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:universalexpensetracker/features/transactions/data/source/local/transaction_local_data_source.dart';
import 'package:universalexpensetracker/features/transactions/domain/repositories/transaction_repository.dart';

class MockTransactionLocalDataSource extends Mock
    implements TransactionLocalDataSource {}

void main() {
  late TransactionRepository transactionRepository;
  late MockTransactionLocalDataSource localDataSource;
  setUp(() {
    localDataSource = MockTransactionLocalDataSource();
    transactionRepository = TransactionRepositoryImpl(localDataSource);
  });
  group("Transactions repository-", () {
    final tTransactionModel = <TransactionModel>[];

    final tTransactionEntities = tTransactionModel
        .map((m) => m.toEntity())
        .toList(); // expected entities

    test('should return transaction entity list', () async {
      //Arrange
      when(
        localDataSource.getTransactionList,
      ).thenAnswer((_) async => tTransactionModel);
      // Act
      final result = await transactionRepository.getTransactionList();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (_) => fail("Expected Right"),
        (r) => expect(r, tTransactionEntities),
      );
      verify(localDataSource.getTransactionList);
    });
  });
}
