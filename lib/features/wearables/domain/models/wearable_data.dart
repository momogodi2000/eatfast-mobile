import 'package:freezed_annotation/freezed_annotation.dart';

part 'wearable_data.freezed.dart';
part 'wearable_data.g.dart';

@freezed
class WearableDevice with _$WearableDevice {
  const factory WearableDevice({
    required String deviceId,
    required String name,
    required WearableType type,
    required WearableBrand brand,
    required String modelName,
    required ConnectionStatus connectionStatus,
    required double batteryLevel,
    required DateTime lastSyncTime,
    String? firmwareVersion,
    String? serialNumber,
    @Default([]) List<WearableCapability> capabilities,
    @Default(true) bool isEnabled,
    Map<String, dynamic>? settings,
  }) = _WearableDevice;

  factory WearableDevice.fromJson(Map<String, dynamic> json) =>
      _$WearableDeviceFromJson(json);
}

@freezed
class HealthData with _$HealthData {
  const factory HealthData({
    required String deviceId,
    required String userId,
    required DateTime timestamp,
    int? heartRate,
    int? steps,
    double? distance,
    int? calories,
    int? sleepMinutes,
    double? bodyTemperature,
    int? bloodOxygen,
    int? systolicPressure,
    int? diastolicPressure,
    double? weight,
    double? bodyFat,
    int? stressLevel,
    Map<String, dynamic>? additionalMetrics,
  }) = _HealthData;

  factory HealthData.fromJson(Map<String, dynamic> json) =>
      _$HealthDataFromJson(json);
}

@freezed
class FitnessActivity with _$FitnessActivity {
  const factory FitnessActivity({
    required String activityId,
    required String deviceId,
    required ActivityType type,
    required DateTime startTime,
    required DateTime endTime,
    required int duration, // in minutes
    int? steps,
    double? distance,
    int? calories,
    int? averageHeartRate,
    int? maxHeartRate,
    List<HeartRateZone>? heartRateZones,
    String? route,
    Map<String, dynamic>? additionalData,
  }) = _FitnessActivity;

  factory FitnessActivity.fromJson(Map<String, dynamic> json) =>
      _$FitnessActivityFromJson(json);
}

@freezed
class SmartWatchNotification with _$SmartWatchNotification {
  const factory SmartWatchNotification({
    required String notificationId,
    required String deviceId,
    required NotificationType type,
    required String title,
    required String message,
    DateTime? scheduledTime,
    @Default(false) bool isSent,
    @Default(false) bool isRead,
    String? actionData,
    Map<String, dynamic>? customData,
  }) = _SmartWatchNotification;

  factory SmartWatchNotification.fromJson(Map<String, dynamic> json) =>
      _$SmartWatchNotificationFromJson(json);
}

@freezed
class OrderReminder with _$OrderReminder {
  const factory OrderReminder({
    required String orderId,
    required String deviceId,
    required String restaurantName,
    required DateTime reminderTime,
    required ReminderType type,
    String? message,
    @Default(false) bool isSent,
    @Default(false) bool isAcknowledged,
  }) = _OrderReminder;

  factory OrderReminder.fromJson(Map<String, dynamic> json) =>
      _$OrderReminderFromJson(json);
}

@freezed
class WearableSettings with _$WearableSettings {
  const factory WearableSettings({
    required String deviceId,
    required String userId,
    @Default(true) bool enableHealthTracking,
    @Default(true) bool enableOrderNotifications,
    @Default(true) bool enableFitnessTracking,
    @Default(true) bool enableQuickOrders,
    @Default(30) int syncIntervalMinutes,
    @Default([]) List<String> enabledNotificationTypes,
    @Default({}) Map<String, dynamic> customSettings,
    DateTime? lastUpdated,
  }) = _WearableSettings;

  factory WearableSettings.fromJson(Map<String, dynamic> json) =>
      _$WearableSettingsFromJson(json);
}

@freezed
class WearableWorkout with _$WearableWorkout {
  const factory WearableWorkout({
    required String workoutId,
    required String deviceId,
    required WorkoutType type,
    required DateTime startTime,
    required DateTime endTime,
    required int duration,
    int? calories,
    int? averageHeartRate,
    int? maxHeartRate,
    double? distance,
    List<WorkoutInterval>? intervals,
    Map<String, dynamic>? summary,
  }) = _WearableWorkout;

  factory WearableWorkout.fromJson(Map<String, dynamic> json) =>
      _$WearableWorkoutFromJson(json);
}

@freezed
class WorkoutInterval with _$WorkoutInterval {
  const factory WorkoutInterval({
    required DateTime startTime,
    required DateTime endTime,
    required int duration,
    int? heartRate,
    double? distance,
    int? calories,
    String? notes,
  }) = _WorkoutInterval;

  factory WorkoutInterval.fromJson(Map<String, dynamic> json) =>
      _$WorkoutIntervalFromJson(json);
}

@freezed
class HeartRateZone with _$HeartRateZone {
  const factory HeartRateZone({
    required String zoneName,
    required int minHeartRate,
    required int maxHeartRate,
    required int timeInZone, // minutes
    required double percentageOfWorkout,
  }) = _HeartRateZone;

  factory HeartRateZone.fromJson(Map<String, dynamic> json) =>
      _$HeartRateZoneFromJson(json);
}

@freezed
class NutritionGoal with _$NutritionGoal {
  const factory NutritionGoal({
    required String goalId,
    required String userId,
    required String deviceId,
    required GoalType type,
    required int targetValue,
    required int currentValue,
    required DateTime goalDate,
    @Default(false) bool isAchieved,
    String? notes,
    Map<String, dynamic>? additionalData,
  }) = _NutritionGoal;

  factory NutritionGoal.fromJson(Map<String, dynamic> json) =>
      _$NutritionGoalFromJson(json);
}

enum WearableType {
  @JsonValue('smartwatch')
  smartwatch,
  @JsonValue('fitness_tracker')
  fitnessTracker,
  @JsonValue('smart_ring')
  smartRing,
  @JsonValue('smart_glasses')
  smartGlasses,
  @JsonValue('earbuds')
  earbuds,
}

enum WearableBrand {
  @JsonValue('apple')
  apple,
  @JsonValue('samsung')
  samsung,
  @JsonValue('garmin')
  garmin,
  @JsonValue('fitbit')
  fitbit,
  @JsonValue('huawei')
  huawei,
  @JsonValue('xiaomi')
  xiaomi,
  @JsonValue('polar')
  polar,
  @JsonValue('oura')
  oura,
  @JsonValue('google')
  google,
  @JsonValue('other')
  other,
}

enum ConnectionStatus {
  @JsonValue('connected')
  connected,
  @JsonValue('connecting')
  connecting,
  @JsonValue('disconnected')
  disconnected,
  @JsonValue('error')
  error,
  @JsonValue('pairing')
  pairing,
}

enum WearableCapability {
  @JsonValue('heart_rate')
  heartRate,
  @JsonValue('step_counting')
  stepCounting,
  @JsonValue('sleep_tracking')
  sleepTracking,
  @JsonValue('gps')
  gps,
  @JsonValue('notifications')
  notifications,
  @JsonValue('voice_control')
  voiceControl,
  @JsonValue('nfc_payments')
  nfcPayments,
  @JsonValue('temperature')
  temperature,
  @JsonValue('blood_oxygen')
  bloodOxygen,
  @JsonValue('stress_monitoring')
  stressMonitoring,
  @JsonValue('workout_tracking')
  workoutTracking,
}

enum ActivityType {
  @JsonValue('walking')
  walking,
  @JsonValue('running')
  running,
  @JsonValue('cycling')
  cycling,
  @JsonValue('swimming')
  swimming,
  @JsonValue('workout')
  workout,
  @JsonValue('yoga')
  yoga,
  @JsonValue('meditation')
  meditation,
  @JsonValue('other')
  other,
}

enum NotificationType {
  @JsonValue('order_placed')
  orderPlaced,
  @JsonValue('order_confirmed')
  orderConfirmed,
  @JsonValue('order_preparing')
  orderPreparing,
  @JsonValue('order_ready')
  orderReady,
  @JsonValue('delivery_started')
  deliveryStarted,
  @JsonValue('delivery_arrived')
  deliveryArrived,
  @JsonValue('meal_reminder')
  mealReminder,
  @JsonValue('hydration_reminder')
  hydrationReminder,
  @JsonValue('nutrition_goal')
  nutritionGoal,
  @JsonValue('promotion')
  promotion,
}

enum ReminderType {
  @JsonValue('meal_time')
  mealTime,
  @JsonValue('order_suggestion')
  orderSuggestion,
  @JsonValue('hydration')
  hydration,
  @JsonValue('medication')
  medication,
  @JsonValue('activity')
  activity,
}

enum WorkoutType {
  @JsonValue('cardio')
  cardio,
  @JsonValue('strength')
  strength,
  @JsonValue('flexibility')
  flexibility,
  @JsonValue('sports')
  sports,
  @JsonValue('outdoor')
  outdoor,
  @JsonValue('indoor')
  indoor,
}

enum GoalType {
  @JsonValue('calories')
  calories,
  @JsonValue('protein')
  protein,
  @JsonValue('carbs')
  carbs,
  @JsonValue('fat')
  fat,
  @JsonValue('water')
  water,
  @JsonValue('steps')
  steps,
  @JsonValue('weight')
  weight,
}

extension WearableTypeExtension on WearableType {
  String get displayName {
    switch (this) {
      case WearableType.smartwatch:
        return 'Montre connectée';
      case WearableType.fitnessTracker:
        return 'Tracker de fitness';
      case WearableType.smartRing:
        return 'Bague connectée';
      case WearableType.smartGlasses:
        return 'Lunettes connectées';
      case WearableType.earbuds:
        return 'Écouteurs connectés';
    }
  }

  String get icon {
    switch (this) {
      case WearableType.smartwatch:
        return '⌚';
      case WearableType.fitnessTracker:
        return '📱';
      case WearableType.smartRing:
        return '💍';
      case WearableType.smartGlasses:
        return '👓';
      case WearableType.earbuds:
        return '🎧';
    }
  }
}

extension WearableBrandExtension on WearableBrand {
  String get displayName {
    switch (this) {
      case WearableBrand.apple:
        return 'Apple';
      case WearableBrand.samsung:
        return 'Samsung';
      case WearableBrand.garmin:
        return 'Garmin';
      case WearableBrand.fitbit:
        return 'Fitbit';
      case WearableBrand.huawei:
        return 'Huawei';
      case WearableBrand.xiaomi:
        return 'Xiaomi';
      case WearableBrand.polar:
        return 'Polar';
      case WearableBrand.oura:
        return 'Oura';
      case WearableBrand.google:
        return 'Google';
      case WearableBrand.other:
        return 'Autre';
    }
  }
}

extension ConnectionStatusExtension on ConnectionStatus {
  String get displayName {
    switch (this) {
      case ConnectionStatus.connected:
        return 'Connecté';
      case ConnectionStatus.connecting:
        return 'Connexion...';
      case ConnectionStatus.disconnected:
        return 'Déconnecté';
      case ConnectionStatus.error:
        return 'Erreur';
      case ConnectionStatus.pairing:
        return 'Appairage...';
    }
  }

  String get color {
    switch (this) {
      case ConnectionStatus.connected:
        return 'green';
      case ConnectionStatus.connecting:
      case ConnectionStatus.pairing:
        return 'orange';
      case ConnectionStatus.disconnected:
        return 'grey';
      case ConnectionStatus.error:
        return 'red';
    }
  }
}

extension ActivityTypeExtension on ActivityType {
  String get displayName {
    switch (this) {
      case ActivityType.walking:
        return 'Marche';
      case ActivityType.running:
        return 'Course';
      case ActivityType.cycling:
        return 'Vélo';
      case ActivityType.swimming:
        return 'Natation';
      case ActivityType.workout:
        return 'Entraînement';
      case ActivityType.yoga:
        return 'Yoga';
      case ActivityType.meditation:
        return 'Méditation';
      case ActivityType.other:
        return 'Autre';
    }
  }

  String get icon {
    switch (this) {
      case ActivityType.walking:
        return '🚶';
      case ActivityType.running:
        return '🏃';
      case ActivityType.cycling:
        return '🚴';
      case ActivityType.swimming:
        return '🏊';
      case ActivityType.workout:
        return '💪';
      case ActivityType.yoga:
        return '🧘';
      case ActivityType.meditation:
        return '🕉️';
      case ActivityType.other:
        return '🎯';
    }
  }
}