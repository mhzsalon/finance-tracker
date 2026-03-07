// import 'dart:io';

// String fileReader(String path) => File(path).readAsStringSync();

// typedef FileReader = String Function(String path);

import 'package:flutter/services.dart';

Future<String> fileReader(String path) async {
  return await rootBundle.loadString(path);
}

typedef FileReader = Future<String> Function(String path);
