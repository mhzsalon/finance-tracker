import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/core/services/export/data_exporter.dart';
import 'package:universalexpensetracker/core/services/export/excel_data_exporter.dart';

final providerOfExcelExporter = Provider<DataExporter>((ref) {
  return ExcelDataExporter();
});
