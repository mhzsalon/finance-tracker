import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/features/categories/data/model/category_model.dart';
import 'package:universalexpensetracker/features/categories/data/source/local/category_local_data_source.dart';

class MockFileReader extends Mock {
  String call(String path);
}

void main() {
  late CategoryLocalDataSourceImpl dataSource;
  late MockFileReader mockFileReader;

  setUp(() {
    mockFileReader = MockFileReader();
    dataSource = CategoryLocalDataSourceImpl(mockFileReader.call);
  });

  final tJsonString = '''
  [
    { "id": 1, "name": "Food", "isCustom": false },
    { "id": 2, "name": "Travel", "isCustom": true }
  ]
  ''';

  final tCategoryModels = [
    CategoryModel(id: 1, name: 'Food', isCustom: false),
    CategoryModel(id: 2, name: 'Travel', isCustom: true),
  ];

  test('should return category list when JSON is valid', () async {
    // arrange
    when(() => mockFileReader(any())).thenReturn(tJsonString);

    // act
    final result = await dataSource.getCategoryList();

    // assert
    expect(result, equals(tCategoryModels));
    verify(() => mockFileReader(any()));
  });

  test('should throw CacheException when file is empty', () async {
    // arrange
    when(() => mockFileReader(any())).thenReturn('');

    // act
    // Not calling the method here, just storing it inside a call variable
    final call = dataSource.getCategoryList;

    // assert
    // Calling the method happens from a higher-order function passed.
    // This is needed to test if calling a method throws an exception.
    expect(() => call(), throwsA(isA<CacheException>()));
  });

  test('should throw CacheException when file not found', () async {
    // arrange
    when(
      () => mockFileReader(any()),
    ).thenThrow(const FileSystemException('File not found'));

    // act
    final call = dataSource.getCategoryList;

    // assert
    expect(() => call(), throwsA(isA<CacheException>()));
  });

  test('should throw CacheException when JSON is invalid', () async {
    // arrange
    when(() => mockFileReader(any())).thenReturn('invalid json');

    // act
    final call = dataSource.getCategoryList;

    // assert
    expect(() => call(), throwsA(isA<CacheException>()));
  });

  test('should throw CacheException when JSON is not a list', () async {
    // arrange
    when(
      () => mockFileReader(any()),
    ).thenReturn('{ "id": "1", "name": "Food", "isCustom": false }');

    // act
    final call = dataSource.getCategoryList;

    // assert
    expect(() => call(), throwsA(isA<CacheException>()));
  });
}
