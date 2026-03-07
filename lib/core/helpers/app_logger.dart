import 'dart:developer';

class AppLogger {
  static void error(String message, Object? error, StackTrace? stackTrace) {
    log(message, error: error, stackTrace: stackTrace, name: "AppLogger");
  }
}
