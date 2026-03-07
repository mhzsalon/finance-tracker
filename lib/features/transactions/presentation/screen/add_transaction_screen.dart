import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:universalexpensetracker/core/extensions/dialog_extension.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';
import 'package:universalexpensetracker/features/categories/di/category_di.dart';
import 'package:universalexpensetracker/features/categories/presentation/provider/state/category_state.dart';
import 'package:universalexpensetracker/features/transactions/di/transactions_di.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';
import 'package:universalexpensetracker/features/transactions/domain/usecase/add_transaction_usecase.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/state/transaction_state.dart';
import 'package:universalexpensetracker/features/transactions/presentation/providers/transaction_type_provider.dart';
import 'package:universalexpensetracker/features/transactions/presentation/widgets/transaction_field_widget.dart';
import 'package:universalexpensetracker/shared/widgets/app_status_dialog.dart';

// ═════════════════════════════════════════════════════════════════════
class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});
  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  DateTime _selectedDate = DateTime.now();
  final _titleCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();

  final _kExpenseColor = AppColors.expense;
  final _kIncomeColor = AppColors.income;

  final GlobalKey<FormState> _addFormKey = GlobalKey<FormState>();

  TransactionType get _selectedTab => ref.watch(
    providerOfTransactionType,
  ); // getter for selected transaction type value

  bool get _isExpense => _selectedTab == TransactionType.expenses; // getter for

  Color get _selectedTabColor => _isExpense ? _kExpenseColor : _kIncomeColor;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(providerOfCategory.notifier).getCategoryList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _amountCtrl.dispose();
    _titleCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenToStateChange();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Transaction',
          style: AppTextStyles.h2.copyWith(letterSpacing: -0.5),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.spMin, vertical: 12.spMin),
        child: Form(
          key: _addFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── segmented toggle ──────────────────────────────────
              _buildToggle(),
              20.hSizedBox,

              // ── title field ───────────────────────────────────────
              TransactionFieldWidget(
                label: 'Title',
                hint: 'e.g. Salary, Groceries',
                ctrl: _titleCtrl,
                focusBorderColor: _selectedTabColor,
              ),
              20.hSizedBox,

              // ── amount field ──────────────────────────────────────
              TransactionFieldWidget(
                label: 'Amount',
                hint: 'NPR 0.00',
                ctrl: _amountCtrl,
                keyboardType: TextInputType.number,
                focusBorderColor: _selectedTabColor,
              ),
              20.hSizedBox,

              // ── date picker ───────────────────────────────────────
              _buildDatePicker(),
              20.hSizedBox,

              // ── category grid (expense only) ──────────────────────
              if (_isExpense) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',

                    style: AppTextStyles.caption.copyWith(
                      fontSize: 13.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                10.hSizedBox,
                _buildCategoryGrid(),
                28.hSizedBox,
              ],
              8.hSizedBox,

              // ── save button ───────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedTabColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _handleAddTransaction,
                  child: Text(
                    _isExpense ? 'Add Expense' : 'Add Income',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ── widgets ──────────────────────────────────────────────────────

  Widget _buildToggle() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      padding: EdgeInsets.all(4.spMin),
      child: Row(
        children: [
          _tab('Income', TransactionType.income),
          _tab('Expense', TransactionType.expenses),
        ],
      ),
    );
  }

  Widget _tab(String label, TransactionType currentTab) {
    final active = _selectedTab == currentTab;
    return Expanded(
      child: GestureDetector(
        onTap: () =>
            ref.read(providerOfTransactionType.notifier).updateTab(currentTab),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: active
                ? _selectedTabColor.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: active
                ? Border.all(
                    color: _selectedTabColor.withOpacity(0.4),
                    width: 1,
                  )
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTextStyles.body.copyWith(
              color: active ? _selectedTabColor : AppColors.labels,
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: AppTextStyles.caption.copyWith(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.hSizedBox,
        GestureDetector(
          onTap: _pickDate,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16.spMin,
              vertical: 14.spMin,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 18.spMin,
                  color: _selectedTabColor,
                ),
                10.wSizedBox,
                Text(
                  DateFormat('dd MMM yyyy').format(_selectedDate),
                  style: AppTextStyles.body.copyWith(fontSize: 15.spMin),
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.labels,
                  size: 20.spMin,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryGrid() {
    return ref
        .watch(providerOfCategory.select((value) => value.getCategoryState))
        .maybeWhen(
          orElse: () => SizedBox.shrink(),
          loading: () => CircularProgressIndicator(),
          error: (failure) => Text("Cache Error"),
          success: (success) {
            if (success.isEmpty) return Text("No category available");
            return Wrap(
              spacing: 10.spMin,
              alignment: WrapAlignment.start,
              runSpacing: 8.spMin,
              children: [
                ...List.generate(success.length, (index) {
                  final cat = success[index];
                  final selected =
                      ref.watch(providerOfCategory).selectedCategory == cat;
                  return GestureDetector(
                    onTap: () =>
                        ref.read(providerOfCategory.notifier).setCategory(cat),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.spMin,
                        vertical: 4.spMin,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? _kExpenseColor.withOpacity(0.15)
                            : AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected
                              ? _kExpenseColor.withOpacity(0.5)
                              : AppColors.border,
                          width: selected ? 1.5 : 1,
                        ),
                      ),
                      child: Text(
                        cat.name,
                        style: AppTextStyles.caption.copyWith(
                          color: selected ? _kExpenseColor : AppColors.labels,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        );
  }

  Future<void> _pickDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (ctx, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            primary: _selectedTabColor,
            surface: AppColors.surface,
          ),
        ),
        child: child!,
      ),
    );
    if (d != null) setState(() => _selectedDate = d);
  }

  void _handleAddTransaction() {
    if (_addFormKey.currentState!.validate()) {
      final params = TransactionParams(
        amount: double.parse(_amountCtrl.text),
        type: _selectedTab,
        title: _titleCtrl.text,
        date: _selectedDate,
        categoryId: ref.read(providerOfCategory).selectedCategory?.id,
      );
      ref
          .read(providerOfTransactionNotifier.notifier)
          .createTransaction(params);
    }
  }

  void _listenToStateChange() {
    ref.listen(
      providerOfTransactionNotifier.select(
        (value) => value.createTransactionState,
      ),
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          error: (failure) => AppStatusDialogHelper.showError(
            context,
            "Something went wrong. Try again later",
          ),
          loading: () => AppStatusDialogHelper.showLoading(context),
          success: (success) {
            _reset();
            AppStatusDialogHelper.showSuccess(context, success);
          },
        );
      },
    );
  }

  void _reset() {
    _titleCtrl.clear();
    _amountCtrl.clear();
    _selectedDate = DateTime.now();
    setState(() {});
  }
}
