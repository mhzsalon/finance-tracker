import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/date_extension.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';
import 'package:universalexpensetracker/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';

class TransactionTile extends StatelessWidget {
  final TransactionEntity transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;
    return Container(
      margin: EdgeInsets.only(bottom: 12.spMin),
      padding: EdgeInsets.symmetric(horizontal: 16.spMin, vertical: 14.spMin),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // CircleAvatar(
          //   radius: 22.spMin,
          //   backgroundColor: transaction.avatarColor.withOpacity(0.2),
          //   child: Text(
          //     transaction.avatarLabel,
          //     style: TextStyle(
          //       color: transaction.avatarColor,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16.spMin,
          //     ),
          //   ),
          // ),
          // 14.wSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.title, style: AppTextStyles.bodyBold),
                3.hSizedBox,
                Text(
                  "${transaction.type.title} · ${transaction.date.toRelativeDate()}",
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          Text(
            '${isIncome ? '+' : '-'}${transaction.amount.toStringAsFixed(0)}',
            style: TextStyle(
              color: isIncome ? AppColors.income : AppColors.expense,
              fontWeight: FontWeight.w700,
              fontSize: 15.spMin,
            ),
          ),
        ],
      ),
    );
  }
}
