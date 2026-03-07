import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/features/categories/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList();
}
