import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final double iconSize;
  final void Function()? onTap;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconSize = 20,
    this.size = 44,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(
          color: AppColors.inputField,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
        ),
        child: Icon(icon, color: AppColors.white, size: iconSize.spMin),
      ),
    );
  }
}
