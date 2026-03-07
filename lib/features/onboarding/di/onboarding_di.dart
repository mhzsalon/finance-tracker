import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:universalexpensetracker/core/storage/hive_local_storage.dart';
import 'package:universalexpensetracker/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:universalexpensetracker/features/onboarding/data/source/local/onboarding_local_data_source.dart';
import 'package:universalexpensetracker/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:universalexpensetracker/features/onboarding/domain/usecases/create_app_pref_usecase.dart';
import 'package:universalexpensetracker/features/onboarding/domain/usecases/get_app_pref_usecase.dart';
import 'package:universalexpensetracker/features/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:universalexpensetracker/features/onboarding/presentation/provider/state/onboarding_state.dart';

final onboardingBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError('Onboarding box not initialized');
});

final onboardingStorageProvider = Provider<HiveLocalStorage>(
  (ref) => HiveLocalStorage(ref.watch(onboardingBoxProvider)),
);

final providerOfOnboardingLocalDataSource = Provider<OnboardingLocalDataSource>(
  (ref) => OnboardingLocalDataSourceImpl(ref.read(onboardingStorageProvider)),
);

final providerOfonboardingRepository = Provider<OnBoardingRepository>(
  (ref) =>
      OnboardingRepositoryImpl(ref.read(providerOfOnboardingLocalDataSource)),
);

final providerOfGetAppPrefUsecase = Provider<GetAppPrefUsecase>(
  (ref) => GetAppPrefUsecase(ref.read(providerOfonboardingRepository)),
);

final providerOfCreateAppPrefUsecase = Provider<CreateAppPrefUsecase>(
  (ref) => CreateAppPrefUsecase(ref.read(providerOfonboardingRepository)),
);

final providerOfOnBoardingNotifier =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
      (ref) => OnboardingNotifier(state: OnboardingState(), ref: ref),
    );
