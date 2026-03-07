import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/features/categories/di/category_di.dart';
import 'package:universalexpensetracker/features/categories/domain/entities/category_entity.dart';
import 'package:universalexpensetracker/features/categories/presentation/provider/state/category_state.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final Ref ref;

  CategoryNotifier({required this.ref, required CategoryState state})
    : super(state);

  void setCategory(CategoryEntity category) =>
      state = state.copyWith(selectedCategory: category);

  Future<void> getCategoryList() async {
    final usecase = ref.read(providerOfGetCategoryUsecase);
    final result = await usecase();

    result.fold(
      (l) =>
          state = state.copyWith(getCategoryState: GetCategoryState.error(l)),
      (r) =>
          state = state.copyWith(getCategoryState: GetCategoryState.success(r)),
    );
  }
}
