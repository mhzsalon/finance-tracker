import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universalexpensetracker/features/categories/domain/entities/category_entity.dart';
import 'package:universalexpensetracker/features/categories/domain/repositories/category_repository.dart';
import 'package:universalexpensetracker/features/categories/domain/usecase/get_category_usecase.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  late GetCategoryUsecase usecase;
  late MockCategoryRepository mockCategoryRepository;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    usecase = GetCategoryUsecase(mockCategoryRepository);
  });

  test('should get category list from the repository', () async {
    // Arrange
    final List<CategoryEntity> tCategoryList = [
      CategoryEntity(id: 0, name: "name", isCustom: false),
    ];

    when(
      mockCategoryRepository.getCategoryList,
    ).thenAnswer((_) async => Right(tCategoryList));

    // Act
    final result = await usecase.call();

    // Assert
    expect(result, Right(tCategoryList));
    // Verify that the method has been called on the Repository
    verify(mockCategoryRepository.getCategoryList);
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockCategoryRepository);
  });
}
