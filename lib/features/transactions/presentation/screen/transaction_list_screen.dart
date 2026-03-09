import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';
import 'package:universalexpensetracker/core/widgets/states/error_state.dart';
import 'package:universalexpensetracker/core/widgets/states/loading_state.dart';
import 'package:universalexpensetracker/features/transactions/presentation/widgets/empty_transaction_widget.dart';

class TransactionListScreen extends ConsumerStatefulWidget {
  const TransactionListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionListScreenState();
}

class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        16.hSizedBox,
        _buildHeader(),
        16.hSizedBox,
        _buildFilters(),
        24.hSizedBox,
        Expanded(child: EmptyTransactionWidget()),
        // EmptyTransactionWidget(),
        // ListView.builder(
        //   itemBuilder: (context, index) => Container(),
        //   // TransactionTile(transaction: _recentTransactions[2]
        //   shrinkWrap: true,
        //   physics: BouncingScrollPhysics(),
        //   itemCount: 10,
        // ),
      ],
    );
  }

  // ── Header ──────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transactions',
          style: AppTextStyles.h1.copyWith(
            fontSize: 26.spMin,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: AppColors.inputField,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border),
          ),
          child: Icon(
            Icons.file_download_outlined,
            color: AppColors.white,
            size: 20.spMin,
          ),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _filterTile(title: "All"),
        _filterTile(title: "Income"),
        _filterTile(title: "Expenses"),
      ],
    );
  }

  Widget _filterTile({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.spMin, vertical: 5.spMin),
      decoration: BoxDecoration(
        color: AppColors.income,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(title, style: AppTextStyles.bodyBold),
    );
  }
}
