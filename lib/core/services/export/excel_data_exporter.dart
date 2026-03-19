import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/core/services/export/data_exporter.dart';

class ExcelDataExporter implements DataExporter {
  @override
  Future<void> export({
    required String fileName,
    required List<String> headers,
    required List<List<dynamic>> rows,
  }) async {
    try {
      final args = {"fileName": fileName, "headers": headers, "rows": rows};

      await compute(_exportExcel, args);
    } catch (e) {
      throw ExportException("Excel export failed");
    }
  }
}

Future<void> _exportExcel(Map<String, dynamic> args) async {
  try {
    final fileName = args["fileName"];
    final headers = List<String>.from(args["headers"]);
    final rows = List<List<dynamic>>.from(args["rows"]);

    final timeStamp = DateTime.now().millisecondsSinceEpoch;

    final filePath = "/storage/emulated/0/Download/${fileName}_$timeStamp.xlsx";

    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    /// headers
    for (int i = 0; i < headers.length; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
          .value = TextCellValue(
        headers[i],
      );
    }

    /// rows
    for (int r = 0; r < rows.length; r++) {
      for (int c = 0; c < rows[r].length; c++) {
        sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: c, rowIndex: r + 1))
            .value = TextCellValue(
          rows[r][c].toString(),
        );
      }
    }

    final bytes = excel.save();
    if (bytes == null) {
      throw ExportException("Excel save failed");
    }

    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes);
  } catch (e) {
    throw ExportException("Failed while generating Excel file");
  }
}
