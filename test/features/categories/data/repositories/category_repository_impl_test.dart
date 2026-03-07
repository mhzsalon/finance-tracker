import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/features/categories/data/model/category_model.dart';
import 'package:universalexpensetracker/features/categories/data/repositories/category_repository_impl.dart';
import 'package:universalexpensetracker/features/categories/data/source/local/category_local_data_source.dart';
import 'package:universalexpensetracker/features/categories/domain/entities/category_entity.dart';
import 'package:universalexpensetracker/features/categories/domain/repositories/category_repository.dart';

class MockCategoryLocalDataSource extends Mock
    implements CategoryLocalDataSource {}

void main() {
  late CategoryRepository categoryRepository;
  late MockCategoryLocalDataSource localDataSource;

  setUp(() {
    localDataSource = MockCategoryLocalDataSource();
    categoryRepository = CategoryRepositoryImpl(localDataSource);
  });

  group("Category Repository-", () {
    test('should get category list from the data source', () async {
      // Arrange
      List<CategoryModel> tCategoryModels = [];

      final tCategoryEntities = tCategoryModels
          .map((m) => m.toEntity())
          .toList(); // expected entities

      when(
        localDataSource.getCategoryList,
      ).thenAnswer((_) async => tCategoryModels);

      // Act
      final result = await categoryRepository.getCategoryList();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (_) => fail("Expected Right"),
        (value) => expect(value, tCategoryEntities),
      );

      verify(localDataSource.getCategoryList).called(1);
    });

    test('should return CacheFailure', () async {
      //Arrange
      when(localDataSource.getCategoryList).thenThrow(CacheException());
      //Act
      final result = await categoryRepository.getCategoryList();
      //Assert
      expect(result, equals(Left(CacheFailure())));
      verify(localDataSource.getCategoryList);
    });
  });
}
