import 'dart:convert';
import 'package:universalexpensetracker/core/constants/asset_paths.dart';
import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/core/helpers/app_logger.dart';
import 'package:universalexpensetracker/core/utils/file_reader.dart';
import 'package:universalexpensetracker/features/categories/data/model/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCategoryList();
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final FileReader _fileReader;

  CategoryLocalDataSourceImpl(this._fileReader);

  @override
  Future<List<CategoryModel>> getCategoryList() async {
    try {
      final jsonString = await _fileReader(kCategoryListPath);

      if (jsonString.isEmpty) {
        throw CacheException();
      }

      final decodedJson = jsonDecode(jsonString);

      if (decodedJson is! List) {
        throw CacheException();
      }
      return decodedJson
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      AppLogger.error("Failed to get category list", e, st);
      throw CacheException();
    }
  }
}
