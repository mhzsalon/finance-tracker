import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:universalexpensetracker/core/constants/asset_paths.dart';
import 'package:universalexpensetracker/core/utils/file_reader.dart';
import 'package:universalexpensetracker/features/categories/data/model/category_model.dart';

void main() {
  final tCategoryModel = CategoryModel(id: 1, name: 'Food', isCustom: false);
  test('should convert from JSON to category model', () async {
    // Arrange
    final jsonString = fileReader(kCategoryListPath);
    final List<dynamic> decodedJson = jsonDecode(jsonString);
    //Act
    final result = CategoryModel.fromJson(decodedJson.first);
    //Asset
    expect(result, tCategoryModel);
  });
}
