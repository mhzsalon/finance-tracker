import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/core/utils/file_reader.dart';
import 'package:universalexpensetracker/features/categories/data/repositories/category_repository_impl.dart';
import 'package:universalexpensetracker/features/categories/data/source/local/category_local_data_source.dart';
import 'package:universalexpensetracker/features/categories/domain/repositories/category_repository.dart';
import 'package:universalexpensetracker/features/categories/domain/usecase/get_category_usecase.dart';
import 'package:universalexpensetracker/features/categories/presentation/provider/category_provider.dart';
import 'package:universalexpensetracker/features/categories/presentation/provider/state/category_state.dart';

final providerOfCategoryLocalDataSource = Provider<CategoryLocalDataSource>(
  (ref) => CategoryLocalDataSourceImpl(fileReader),
);

final providerOfCategoryRepository = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryImpl(ref.read(providerOfCategoryLocalDataSource)),
);

final providerOfGetCategoryUsecase = Provider<GetCategoryUsecase>(
  (ref) => GetCategoryUsecase(ref.read(providerOfCategoryRepository)),
);

final providerOfCategory =
    StateNotifierProvider<CategoryNotifier, CategoryState>(
      (ref) => CategoryNotifier(ref: ref, state: CategoryState()),
    );
