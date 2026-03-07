import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/constants/asset_paths.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/theme/app_text_styles.dart';
import 'package:universalexpensetracker/core/utils/navigation.dart';
import 'package:universalexpensetracker/features/onboarding/di/onboarding_di.dart';
import 'package:universalexpensetracker/shared/screens/home_tab_screen.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBg,
      body: SafeArea(
        child: Column(
          children: [
            /// Top Spacer (pushes content slightly down)
            const Spacer(flex: 2),

            /// MAIN CONTENT
            Column(
              children: [
                Text(
                  "FINANCY",
                  style: AppTextStyles.h2.copyWith(
                    fontSize: 40.sp,
                    letterSpacing: 1.5,
                  ),
                ),

                16.hSizedBox,

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),

                  child: Text(
                    "Take control of your finances by tracking, monitoring, and achieving your money goals",
                    style: AppTextStyles.caption,
                    textAlign: TextAlign.center,
                  ),
                ),

                40.hSizedBox,

                Image.asset(AssetPaths.wallet, height: 160.h),

                40.hSizedBox,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _labelBuilder(
                      icon: Icons.bar_chart_rounded,
                      label: "Add Transactions",
                    ),
                    _labelBuilder(
                      icon: Icons.currency_bitcoin_rounded,
                      label: "Visual Analytics",
                    ),
                    _labelBuilder(icon: Icons.public, label: "Export Reports"),
                  ],
                ),
              ],
            ),

            /// Bottom Spacer (balances vertically)
            const Spacer(flex: 3),

            /// Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(providerOfOnBoardingNotifier.notifier)
                        .createAppPref();
                    Navigation.replace(context, HomeTabScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: AppTextStyles.sectionTitle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),

            24.hSizedBox,
          ],
        ),
      ),
    );
  }

  Widget _labelBuilder({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, size: 28.sp, color: AppColors.buttons),
        SizedBox(height: 8.h),
        Text(label, style: AppTextStyles.labels, textAlign: TextAlign.center),
      ],
    );
  }
}
