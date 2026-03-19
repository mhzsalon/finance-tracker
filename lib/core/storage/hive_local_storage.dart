import 'dart:convert';

import 'package:hive/hive.dart';
import 'local_storage.dart';

class HiveLocalStorage implements LocalStorage<Map<String, dynamic>> {
  final Box box;

  HiveLocalStorage(this.box);

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    return box.values
        .map((e) => jsonDecode(e) as Map<String, dynamic>)
        .toList();
  }

  @override
  Future<void> saveAll(List<Map<String, dynamic>> items) async {
    await box.clear();
    await box.addAll(items);
  }

  @override
  Future<void> add(Map<String, dynamic> item) async {
    await box.add(jsonEncode(item));
  }

  @override
  Future<void> clear() async {
    await box.clear();
  }

  @override
  Stream<List<Map<String, dynamic>>> getStreamData() async* {
    //  Emit initial state first
    yield box.values.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();

    //  Then emit on changes
    yield* box.watch().map((_) {
      return box.values
          .map((e) => jsonDecode(e) as Map<String, dynamic>)
          .toList();
    });
  }
}
