import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universalexpensetracker/core/error/failures.dart';
import 'package:universalexpensetracker/features/categories/domain/entities/category_entity.dart';
part 'category_state.freezed.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  factory CategoryState({
    final CategoryEntity? selectedCategory,
    @Default(GetCategoryState.initial())
    final GetCategoryState getCategoryState,
  }) = _CategoryState;
}

@freezed
class GetCategoryState with _$GetCategoryState {
  const factory GetCategoryState.initial() = _GetCategoryStateInitial;
  const factory GetCategoryState.loading() = _GetCategoryStateLoading;
  const factory GetCategoryState.success(final List<CategoryEntity> success) =
      _GetCategoryStateSuccess;
  const factory GetCategoryState.error(final Failure failure) =
      _GetCategoryStateError;
}
