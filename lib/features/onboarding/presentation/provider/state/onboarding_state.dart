import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universalexpensetracker/core/error/failures.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    /// The state of the reels feed.
    @Default(AppRefState.initial()) final AppRefState appRefState,
  }) = _OnboardingState;
}

@freezed
class AppRefState with _$AppRefState {
  const factory AppRefState.initial() = _AppRefStateInitial;
  const factory AppRefState.loading() = _AppRefStateLoading;
  const factory AppRefState.success(final bool success) = _AppRefStateSuccess;
  const factory AppRefState.error(final Failure failure) = _AppRefStateError;
}
