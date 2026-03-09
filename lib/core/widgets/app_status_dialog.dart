import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';

enum AppDialogType { loading, success, error }

class AppStatusDialog extends StatelessWidget {
  final AppDialogType type;
  final String message;

  const AppStatusDialog({super.key, required this.type, required this.message});

  @override
  Widget build(BuildContext context) {
    final isLoading = type == AppDialogType.loading;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.spMin, vertical: 28.spMin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading)
              const CircularProgressIndicator()
            else
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: type == AppDialogType.success
                      ? AppColors.income.withOpacity(0.15)
                      : AppColors.error.withOpacity(0.15),
                ),
                child: Icon(
                  type == AppDialogType.success ? Icons.check : Icons.close,
                  size: 32.spMin,
                  color: type == AppDialogType.success
                      ? AppColors.income
                      : AppColors.error,
                ),
              ),
            20.verticalSpace,
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.spMin, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
