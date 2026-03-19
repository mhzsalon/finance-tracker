abstract class DataExporter {
  Future<void> export({
    required String fileName,
    required List<String> headers,
    required List<List<dynamic>> rows,
  });
}
