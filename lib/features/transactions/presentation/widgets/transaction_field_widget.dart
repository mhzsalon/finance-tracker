import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';

class TransactionFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController ctrl;
  final TextInputType keyboardType;
  final Color focusBorderColor;
  const TransactionFieldWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.ctrl,
    this.keyboardType = TextInputType.text,
    this.focusBorderColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.hSizedBox,
        TextFormField(
          controller: ctrl,
          keyboardType: keyboardType,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter the ${label.toLowerCase()}";
            }
            return null;
          },
          style: AppTextStyles.caption.copyWith(fontSize: 15.spMin),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.labels.withOpacity(0.5)),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.spMin,
              vertical: 14.spMin,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: focusBorderColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.error, width: 1.5),
            ),
            errorStyle: AppTextStyles.caption.copyWith(color: AppColors.error),
          ),
        ),
      ],
    );
  }
}
