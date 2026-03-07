import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/constants/asset_paths.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';
import 'package:universalexpensetracker/core/utils/navigation.dart';
import 'package:universalexpensetracker/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:universalexpensetracker/features/onboarding/di/onboarding_di.dart';
import 'package:universalexpensetracker/features/onboarding/presentation/provider/state/onboarding_state.dart';
import 'package:universalexpensetracker/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:universalexpensetracker/shared/screens/home_tab_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Future.delayed(Duration(seconds: 2)).then(
        (value) => ref.read(providerOfOnBoardingNotifier.notifier).getAppPref(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _listenToStateChange();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          height: 120.h,
          width: 120.w,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetPaths.appIcon)),
            boxShadow: [
              BoxShadow(
                color: AppColors.textPrimary.withOpacity(0.2),
                blurRadius: 20,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenToStateChange() {
    ref.listen(
      providerOfOnBoardingNotifier.select((value) => value.appRefState),
      (previous, next) {
        next.maybeWhen(
          success: (success) {
            if (success) {
              _navigateTo(HomeTabScreen());
            } else {
              _navigateTo(OnboardingScreen());
            }
          },
          error: (failure) => _navigateTo(OnboardingScreen()),
          orElse: () => _navigateTo(OnboardingScreen()),
        );
      },
    );
  }

  void _navigateTo(Widget widget) {
    Navigation.replace(context, widget);
  }
}
