import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Onboarding state management
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(const OnboardingState.initial());

  /// Set current page index
  void setCurrentPage(int page) {
    state = OnboardingState.pageChanged(currentPage: page);
  }

  /// Complete onboarding
  void completeOnboarding() {
    state = const OnboardingState.completed();
  }

  /// Reset onboarding
  void reset() {
    state = const OnboardingState.initial();
  }
}

/// Onboarding states
sealed class OnboardingState {
  final int currentPage;
  
  const OnboardingState({this.currentPage = 0});
  
  const factory OnboardingState.initial() = OnboardingInitial;
  const factory OnboardingState.pageChanged({required int currentPage}) = OnboardingPageChanged;
  const factory OnboardingState.completed() = OnboardingCompleted;
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial() : super(currentPage: 0);
}

class OnboardingPageChanged extends OnboardingState {
  const OnboardingPageChanged({required int currentPage}) : super(currentPage: currentPage);
}

class OnboardingCompleted extends OnboardingState {
  const OnboardingCompleted() : super(currentPage: 2);
}

/// Provider for onboarding state
final onboardingProvider = StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier();
});
