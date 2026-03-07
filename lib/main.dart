import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universalexpensetracker/core/storage/hive_boxes.dart';
import 'package:universalexpensetracker/core/theme/app_theme.dart';
import 'package:universalexpensetracker/features/onboarding/di/onboarding_di.dart';
import 'package:universalexpensetracker/features/transactions/di/transactions_di.dart';
import 'package:universalexpensetracker/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  final transactionBox = await Hive.openBox(HiveBoxes.transaction);
  final onboardingBox = await Hive.openBox(HiveBoxes.onboarding);
  runApp(
    ProviderScope(
      overrides: [
        transactionBoxProvider.overrideWithValue(transactionBox),
        onboardingBoxProvider.overrideWithValue(onboardingBox),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
