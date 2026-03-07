import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universalexpensetracker/features/categories/domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._(); // private constructor

  const factory CategoryModel({
    required int id,
    required String name,
    required bool isCustom,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryEntity toEntity() =>
      CategoryEntity(id: id, name: name, isCustom: isCustom);
}
