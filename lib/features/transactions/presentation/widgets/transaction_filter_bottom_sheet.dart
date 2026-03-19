import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';
import 'package:universalexpensetracker/core/utils/navigation.dart';
import 'package:universalexpensetracker/features/transactions/di/transactions_di.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/transaction_filter_provider.dart';

// ============================================
// FILTER BOTTOM SHEET
// ============================================

class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FilterBottomSheet(),
    );
  }

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  TransactionType? get _type => ref
      .watch(providerOfTransactionFilterType)
      .type; // getter for selected transaction type value

  // String? _category;
  DateTime? get _month => ref.watch(providerOfTransactionFilterType).dateFilter;

  final _months = List.generate(
    12,
    (i) => DateTime(DateTime.now().year, i + 1),
  );
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _initialize());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),

      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          12.hSizedBox,
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2F3A),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          16.hSizedBox,

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: _resetFilter,
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF00C9A7),
                  ),
                ),
              ),
            ],
          ),
          24.hSizedBox,

          // Transaction Type
          _buildSectionLabel('Transaction Type'),
          10.hSizedBox,
          _buildTypeFilter(),
          // Month Picker
          24.hSizedBox,
          _buildSectionLabel('Month'),
          10.hSizedBox,
          _buildDateFilter(),
          // Apply Button
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30.spMin,
            ).copyWith(top: 45.spMin),
            child: SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: _applyFilter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.income,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: AppTextStyles.sectionTitle,
                ),
                child: const Text('Apply Filter'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateFilter() {
    return Wrap(
      spacing: 8.spMin,
      alignment: WrapAlignment.start,
      runSpacing: 10.spMin,

      children: [
        ...List.generate(_months.length, (i) {
          final m = _months[i];
          final selected = m.month == _month?.month;
          const monthNames = [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec',
          ];
          return GestureDetector(
            onTap: () => ref
                .read(providerOfTransactionFilterType.notifier)
                .updateDateRange(m),

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.income.withOpacity(0.15)
                    : AppColors.inputField,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: selected ? AppColors.income : AppColors.borderLight,
                ),
              ),
              child: Text(
                monthNames[m.month - 1],
                style: TextStyle(
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w600,
                  color: selected ? AppColors.income : const Color(0xFF6B7280),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildTypeFilter() {
    return Row(
      children: TransactionType.values.map((t) {
        final selected = _type == t;
        return Expanded(
          child: GestureDetector(
            onTap: () => ref
                .read(providerOfTransactionFilterType.notifier)
                .updateType(t),

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(
                right: t != TransactionType.expenses ? 10 : 0,
              ),
              padding: EdgeInsets.symmetric(vertical: 10.spMin),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.income.withOpacity(0.15)
                    : AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selected ? AppColors.income : AppColors.borderLight,
                  width: 1.5,
                ),
              ),
              child: Text(
                t.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? AppColors.income : const Color(0xFF6B7280),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF6B7280),
        letterSpacing: 0.5,
      ),
    );
  }

  void _resetFilter() {
    ref.read(providerOfTransactionNotifier.notifier).resetFilters();
    Navigation.pop(context);
  }

  void _applyFilter() {
    ref
        .read(providerOfTransactionNotifier.notifier)
        .udateFilterValues(dateFilter: _month, type: _type);
    Navigation.pop(context);
  }

  void _initialize() {
    final previousFilter = ref.read(providerOfTransactionNotifier);
    ref.read(providerOfTransactionFilterType.notifier)
      ..updateType(previousFilter.type)
      ..updateCategory(previousFilter.categoryId)
      ..updateDateRange(previousFilter.dateFilter);
  }
}
