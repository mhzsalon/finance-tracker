import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/utils/navigation.dart';
import 'package:universalexpensetracker/features/transactions/presentation/screen/add_transaction_screen.dart';
import 'package:universalexpensetracker/shared/enums/home_tab_enums.dart';
import 'package:universalexpensetracker/shared/providers/home_tab_provider.dart';

class HomeTabScreen extends ConsumerStatefulWidget {
  const HomeTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends ConsumerState<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    final currentScreen = ref.watch(providerOfHomeTab).screen;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  final offsetAnimation = Tween<Offset>(
                    begin: const Offset(0.1, 0),
                    end: Offset.zero,
                  ).animate(animation);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: Padding(
                  key: ValueKey(currentScreen.runtimeType),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: currentScreen,
                ),
              ),
            ),

            _buildBottomNav(),
          ],
        ),
      ),
      floatingActionButton: _buildFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomNav() {
    final selectedTab = ref.watch(providerOfHomeTab);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.spMin),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(HomeTabEnums.values.length, (i) {
            final isSelected = selectedTab == HomeTabEnums.values[i];
            final currentTab = HomeTabEnums.values[i];
            return GestureDetector(
              onTap: () => _handleOnPressed(currentTab),
              behavior: HitTestBehavior.translucent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    currentTab.icon,
                    color: isSelected ? AppColors.income : AppColors.labels,
                    size: 22,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    currentTab.title,
                    style: TextStyle(
                      color: isSelected ? AppColors.income : AppColors.labels,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // ── FAB ───────────────────────────────────────────────────────────
  Widget _buildFAB() {
    return GestureDetector(
      onTap: () => Navigation.push(context, AddTransactionScreen()),
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.income, Color(0xFF00A388)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.income.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  void _handleOnPressed(HomeTabEnums currentTab) {
    if (currentTab == HomeTabEnums.add) return;
    ref.read(providerOfHomeTab.notifier).updateTab(currentTab);
  }
}
