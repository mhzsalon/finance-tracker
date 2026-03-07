import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExt on num {
  /// Returns a [SizedBox] with a width of [this].
  Widget get wSizedBox => SizedBox(width: toDouble().spMin);

  /// Returns a [SizedBox] with a height of [this].
  Widget get hSizedBox => SizedBox(height: toDouble().spMin);
}

/// Extension to convert degrees to radians.s
extension ConversionExt on num {
  /// Converts degrees to radians.
  double degToRad() => this * (math.pi / 180.0);
}

extension CurrencyExt on num {
  /// Returns a formatted currency string.
  ///
  /// If the number is 1234.56, it will return 'Rs 1234.56'.
  ///
  /// If the number is 1234.00, it will return 'Rs 1234'.
  ///
  /// If the number is 1234.50, it will return 'Rs 1234.5'.
  String get asCurrency {
    final formatted = toStringAsFixed(2);
    if (formatted.endsWith('.00')) {
      return 'Rs ${formatted.substring(0, formatted.length - 3)}';
    } else if (formatted.endsWith('0')) {
      return 'Rs ${formatted.substring(0, formatted.length - 1)}';
    } else {
      return 'Rs $formatted';
    }
  }
}

/// Converts a number into a readable K/M/B format.
/// Example: 1200 -> 1.2K, 5000000 -> 5M
extension NumberFormatter on int {
  String toKMB() {
    if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed((this % 1000000000 == 0) ? 0 : 1)}B';
    } else if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed((this % 1000000 == 0) ? 0 : 1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed((this % 1000 == 0) ? 0 : 1)}K';
    } else {
      return toString();
    }
  }
}
