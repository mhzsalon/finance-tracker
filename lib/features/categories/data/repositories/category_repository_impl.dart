import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/features/categories/data/source/local/category_local_data_source.dart';
import 'package:universalexpensetracker/features/categories/domain/entities/category_entity.dart';
import 'package:universalexpensetracker/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource categoryLocalDataSource;

  CategoryRepositoryImpl(this.categoryLocalDataSource);
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList() async {
    try {
      final categories = await categoryLocalDataSource.getCategoryList();
      final categoryEntities = categories.map((m) => m.toEntity()).toList();
      return Right(categoryEntities);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
