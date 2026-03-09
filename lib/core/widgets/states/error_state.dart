// ============================================
// 2. ERROR STATE
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';

class ErrorState extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onRetry;

  const ErrorState({
    super.key,
    this.title = 'Something went wrong',
    this.description = "We couldn't load your data. Please try again.",
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: const Color(0xFF2D1519),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.error_outline_rounded,
              size: 30.spMin,
              color: Color(0xFFFF5C7A),
            ),
          ),
          16.hSizedBox,
          Text(title, style: AppTextStyles.sectionTitle),
          6.hSizedBox,
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xFF6B7280),
              height: 1.4,
            ),
          ),
          if (onRetry != null) ...[
            20.hSizedBox,
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh_rounded, size: 18.spMin),
              label: const Text('Try again'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: const BorderSide(color: Color(0xFF2A2F3A)),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
