class CacheException implements Exception {}

class ExportException implements Exception {
  final String message;

  ExportException([this.message = "Failed to export file"]);
}
