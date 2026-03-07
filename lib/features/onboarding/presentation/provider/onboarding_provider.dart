import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/features/onboarding/di/onboarding_di.dart';
import 'package:universalexpensetracker/features/onboarding/presentation/provider/state/onboarding_state.dart';

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final Ref _ref;

  OnboardingNotifier({required OnboardingState state, required Ref ref})
    : _ref = ref,
      super(state);

  Future<void> createAppPref() async {
    final usecase = _ref.read(providerOfCreateAppPrefUsecase);
    await usecase();
  }

  Future<void> getAppPref() async {
    state = state.copyWith(appRefState: AppRefState.loading());
    final usecase = _ref.read(providerOfGetAppPrefUsecase);
    final result = await usecase();

    result.fold(
      (l) => state = state.copyWith(appRefState: AppRefState.error(l)),
      (r) => state = state.copyWith(appRefState: AppRefState.success(r)),
    );
  }
}
