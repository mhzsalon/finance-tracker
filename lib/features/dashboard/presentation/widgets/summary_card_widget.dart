import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';

class SummaryCard extends StatelessWidget {
  final String label;
  final String amount;
  final IconData icon;
  final List<Color> gradientColors;
  final Color iconBg;
  final IconData arrowIcon;

  const SummaryCard({
    super.key,
    required this.label,
    required this.amount,
    required this.icon,
    required this.gradientColors,
    required this.iconBg,
    required this.arrowIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.spMin),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.spMin),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.white, size: 16.spMin),
              ),
              Icon(
                arrowIcon,
                color: AppColors.white.withOpacity(0.8),
                size: 18.spMin,
              ),
            ],
          ),
          20.hSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4.spMin),
                child: Text(
                  "NPR",
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              4.wSizedBox,
              Text(
                amount,
                style: AppTextStyles.h2.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          4.hSizedBox,
          Text(
            label,
            style: TextStyle(
              color: AppColors.white.withOpacity(0.75),
              fontSize: 12.spMin,
            ),
          ),
        ],
      ),
    );
  }
}
