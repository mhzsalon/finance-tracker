import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universalexpensetracker/core/extensions/numbers_extension.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';

class LoadingState extends StatefulWidget {
  const LoadingState({super.key});

  @override
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: AppColors.income,
            backgroundColor: AppColors.inputField,
          ),
        ),
        16.hSizedBox,
        Text(
          'Loading...',
          style: TextStyle(fontSize: 14.sp, color: Color(0xFF6B7280)),
        ),
        // AnimatedBuilder(
        //   animation: _ctrl,
        //   builder: (_, __) {
        //     final opacity =
        //         0.4 + 0.6 * (0.5 + 0.5 * cos(_ctrl.value * 2 * pi));
        //     return Opacity(
        //       opacity: opacity,
        //       child: Text(
        //         'Loading...',
        //         style: TextStyle(fontSize: 14.sp, color: Color(0xFF6B7280)),
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
