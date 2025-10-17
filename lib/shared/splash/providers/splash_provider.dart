import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';

/// Splash screen state management
class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(const SplashState.initial());

  /// Check if this is the first time user opens the app
  Future<bool> checkFirstTimeUser() async {
    state = const SplashState.loading();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final isFirstTime = !prefs.containsKey(AppConstants.keyIsFirstTime);
      
      if (isFirstTime) {
        await prefs.setBool(AppConstants.keyIsFirstTime, false);
      }
      
      state = SplashState.loaded(isFirstTime: isFirstTime);
      return isFirstTime;
    } catch (e) {
      state = SplashState.error(message: e.toString());
      // Default to first time if error occurs
      return true;
    }
  }

  /// Initialize app data
  Future<void> initializeApp() async {
    try {
      // Initialize Hive, check authentication status, etc.
      // Add any other initialization logic here
      
      await Future.delayed(const Duration(milliseconds: 1000)); // Simulate init
      
      // You can add more initialization logic here:
      // - Initialize local database
      // - Check authentication token
      // - Load user preferences
      // - Initialize notification service (local only)
      
    } catch (e) {
      state = SplashState.error(message: 'Failed to initialize app: ${e.toString()}');
    }
  }
}

/// Splash screen states
sealed class SplashState {
  const SplashState();
  
  const factory SplashState.initial() = SplashInitial;
  const factory SplashState.loading() = SplashLoading;
  const factory SplashState.loaded({required bool isFirstTime}) = SplashLoaded;
  const factory SplashState.error({required String message}) = SplashError;
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashLoaded extends SplashState {
  final bool isFirstTime;
  
  const SplashLoaded({required this.isFirstTime});
}

class SplashError extends SplashState {
  final String message;
  
  const SplashError({required this.message});
}

/// Provider for splash screen state
final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>((ref) {
  return SplashNotifier();
});
