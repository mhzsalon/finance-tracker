import 'package:flutter/material.dart';
import 'package:universalexpensetracker/core/widgets/app_status_dialog.dart';

extension AppStatusDialogHelper on AppStatusDialog {
  static bool _isDialogShowing = false;

  static Future<void> _dismissIfShowing(BuildContext context) async {
    if (_isDialogShowing &&
        Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
      _isDialogShowing = false;
    }
  }

  static Future<void> showLoading(BuildContext context) async {
    await _dismissIfShowing(context);

    _isDialogShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AppStatusDialog(
        type: AppDialogType.loading,
        message: "Please wait...",
      ),
    );
  }

  static Future<void> showSuccess(BuildContext context, String message) async {
    await _dismissIfShowing(context);

    _isDialogShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          AppStatusDialog(type: AppDialogType.success, message: message),
    );

    await Future.delayed(const Duration(milliseconds: 800));

    if (!context.mounted) return;

    await _dismissIfShowing(context);
  }

  static Future<void> showError(BuildContext context, String message) async {
    await _dismissIfShowing(context);

    _isDialogShowing = true;

    showDialog(
      context: context,
      builder: (_) =>
          AppStatusDialog(type: AppDialogType.error, message: message),
    );
  }
}
