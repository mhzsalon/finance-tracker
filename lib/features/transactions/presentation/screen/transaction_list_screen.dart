import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';
import 'package:universalexpensetracker/core/widgets/custom_icon_button.dart';
import 'package:universalexpensetracker/core/widgets/states/error_state.dart';
import 'package:universalexpensetracker/core/widgets/states/loading_state.dart';
import 'package:universalexpensetracker/features/transactions/di/transactions_di.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/transaction_provider.dart';
import 'package:universalexpensetracker/features/transactions/presentation/widgets/empty_transaction_widget.dart';
import 'package:universalexpensetracker/features/transactions/presentation/widgets/transaction_filter_bottom_sheet.dart';
import 'package:universalexpensetracker/features/transactions/presentation/widgets/transaction_title.dart';

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
        // 16.hSizedBox,
        // _buildFilters(),
        14.hSizedBox,
        Expanded(child: _transactionBuilder()),
      ],
    );
  }

  Widget _transactionBuilder() {
    final transactionAsync = ref.watch(streamProviderOfTransaction);
    return transactionAsync.when(
      data: (data) {
        if (data.isEmpty) return EmptyTransactionWidget();
        return ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(top: index == 0 ? 16.h : 0),
            child: TransactionTile(transaction: data[index]),
          ),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: data.length,
        );
      },
      error: (e, _) =>
          ErrorState(onRetry: () => ref.refresh(streamProviderOfTransaction)),
      loading: () => LoadingState(),
    );
  }

  // ── Header ──────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Transactions',
          style: AppTextStyles.h1.copyWith(
            fontSize: 26.spMin,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        Spacer(),
        CustomIconButton(icon: Icons.tune_rounded, onTap: _showFilterOptions),
        8.wSizedBox,
        CustomIconButton(
          icon: Icons.file_download_outlined,
          onTap: () => ref
              .read(providerOfTransactionNotifier.notifier)
              .exportTransaction(),
        ),
      ],
    );
  }

  void _showFilterOptions() {
    FilterBottomSheet.show(context);
  }
}
