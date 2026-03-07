import 'package:dartz/dartz.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/core/usecases/usecase.dart';
import 'package:universalexpensetracker/features/categories/domain/entities/category_entity.dart';
import 'package:universalexpensetracker/features/categories/domain/repositories/category_repository.dart';

class GetCategoryUsecase implements Usecase<List<CategoryEntity>, void> {
  final CategoryRepository categoryRepository;

  GetCategoryUsecase(this.categoryRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call({void params}) {
    return categoryRepository.getCategoryList();
  }
}
