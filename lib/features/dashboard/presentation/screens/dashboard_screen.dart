import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';
import 'package:universalexpensetracker/features/dashboard/presentation/provider/dashboard_provider.dart';
import 'package:universalexpensetracker/features/dashboard/presentation/widgets/summary_card_widget.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/presentation/widgets/transaction_title.dart';
import 'package:universalexpensetracker/shared/enums/home_tab_enums.dart';
import 'package:universalexpensetracker/shared/providers/home_tab_provider.dart';

// ─── Dashboard Screen ─────────────────────────────────────────────
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.hSizedBox,
        _buildHeader(),
        24.hSizedBox,
        _bodyBuilder(),
        24.hSizedBox,
      ],
    );
  }

  Widget _bodyBuilder() {
    final dashboardAsync = ref.watch(streamProviderOfDashboard);
    return dashboardAsync.when(
      data: (data) {
        return Column(
          children: [
            _buildSummaryCards(
              totalExpenses: data.totalExpense,
              totalIncome: data.totalIncome,
            ),
            24.hSizedBox,
            _buildSpendingChart(),
            24.hSizedBox,
            _buildRecentTransactions(data.recentTransactions),
          ],
        );
      },
      error: (e, _) => Center(child: Text('Error: $e')),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }

  // ── Header ──────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning 👋',
              style: TextStyle(color: AppColors.labels, fontSize: 14),
            ),
            4.hSizedBox,
            Text(
              'My Finance',
              style: AppTextStyles.h1.copyWith(
                fontSize: 26.spMin,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
          ],
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
            Icons.notifications_outlined,
            color: AppColors.white,
            size: 20.spMin,
          ),
        ),
      ],
    );
  }

  // ── Summary Cards ────────────────────────────────────────────────
  Widget _buildSummaryCards({
    required double totalIncome,
    required double totalExpenses,
  }) {
    return Row(
      children: [
        Expanded(
          child: SummaryCard(
            label: 'Total Income',
            amount: totalIncome.toInt().toKMB(),
            icon: Icons.arrow_upward_rounded,
            gradientColors: AppColors.incomeGradient,
            iconBg: const Color(0xFF00A388),
            arrowIcon: Icons.north_east,
          ),
        ),
        16.wSizedBox,
        Expanded(
          child: SummaryCard(
            label: 'Total Expense',
            amount: totalExpenses.toInt().toKMB(),
            icon: Icons.arrow_downward_rounded,
            gradientColors: AppColors.expenseGradient,
            iconBg: const Color(0xFFE0405D),
            arrowIcon: Icons.south_east,
          ),
        ),
      ],
    );
  }

  // ── Spending Chart ────────────────────────────────────────────────
  Widget _buildSpendingChart() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Spending Breakdown',
                style: AppTextStyles.sectionTitle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text('This Month', style: AppTextStyles.caption),
            ],
          ),
          20.hSizedBox,
          Row(
            children: [
              // Donut Chart
              SizedBox(
                width: 120.w,
                height: 120.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(120, 120),
                      painter: _DonutPainter(
                        segments: [
                          _DonutSegment(AppColors.income, 0.45),
                          _DonutSegment(AppColors.expense, 0.30),
                          _DonutSegment(AppColors.blue, 0.15),
                          _DonutSegment(const Color(0xFFF59E0B), 0.10),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('\$1,996', style: AppTextStyles.bodyBold),
                        Text(
                          'Total',
                          style: TextStyle(
                            color: AppColors.labels,
                            fontSize: 10.spMin,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Legend
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _LegendItem(
                      color: AppColors.income,
                      label: 'Income',
                      sublabel: 'Salary, Freelance',
                    ),
                    SizedBox(height: 12),
                    _LegendItem(
                      color: AppColors.expense,
                      label: 'Food & Bills',
                      sublabel: 'Utilities, Dining',
                    ),
                    SizedBox(height: 12),
                    _LegendItem(
                      color: AppColors.blue,
                      label: 'Transport',
                      sublabel: 'Travel, Rides',
                    ),
                    SizedBox(height: 12),
                    _LegendItem(
                      color: Color(0xFFF59E0B),
                      label: 'Others',
                      sublabel: 'Misc expenses',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Recent Transactions ───────────────────────────────────────────
  Widget _buildRecentTransactions(List<TransactionEntity> recentTransactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Transactions',
              style: AppTextStyles.sectionTitle.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => ref
                  .read(providerOfHomeTab.notifier)
                  .updateTab(HomeTabEnums.transaction),
              child: Text(
                'See all',
                style: TextStyle(color: AppColors.income, fontSize: 13),
              ),
            ),
          ],
        ),
        16.hSizedBox,
        ...recentTransactions.map((t) => TransactionTile(transaction: t)),
      ],
    );
  }
}

// ─── Legend Item Widget ───────────────────────────────────────────
class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String sublabel;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.sublabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.bodyBold.copyWith(fontSize: 13.spMin),
            ),
            Text(
              sublabel,
              style: AppTextStyles.caption.copyWith(fontSize: 11.spMin),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Transaction Tile Widget ──────────────────────────────────────

// ─── Donut Chart Painter ──────────────────────────────────────────
class _DonutSegment {
  final Color color;
  final double fraction;
  const _DonutSegment(this.color, this.fraction);
}

class _DonutPainter extends CustomPainter {
  final List<_DonutSegment> segments;
  const _DonutPainter({required this.segments});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(10, 10, size.width - 20, size.height - 20);
    double startAngle = -3.14159 / 2; // Start from top

    for (final seg in segments) {
      final sweepAngle = 2 * 3.14159 * seg.fraction;
      final paint = Paint()
        ..color = seg.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 16
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(rect, startAngle, sweepAngle - 0.1, false, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
