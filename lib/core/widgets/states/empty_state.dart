// ============================================
// 1. EMPTY STATE
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 64.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.inputField,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 30.spMin, color: const Color(0xFF6B7280)),
          ),
          16.hSizedBox,
          Text(title, style: AppTextStyles.sectionTitle),
          if (description != null) ...[
            6.hSizedBox,
            Text(
              description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFF6B7280),
                height: 1.4,
              ),
            ),
          ],
          if (actionLabel != null && onAction != null) ...[
            20.hSizedBox,
            ElevatedButton.icon(
              onPressed: onAction,
              icon: Icon(Icons.add, size: 18.spMin),
              label: Text(actionLabel!),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C9A7),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
