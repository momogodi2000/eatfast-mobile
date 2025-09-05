import '../models/wearable_data.dart';

abstract class WearableRepository {
  /// Device Management
  Future<void> initialize();
  Future<List<WearableDevice>> getAvailableDevices();
  Future<bool> connectDevice(String deviceId);
  Future<void> disconnectDevice(String deviceId);
  Future<WearableDevice?> getConnectedDevice();
  Future<bool> pairNewDevice(WearableBrand brand, String deviceName);
  
  /// Health Data
  Future<HealthData?> getLatestHealthData(String deviceId);
  Future<List<HealthData>> getHealthDataHistory({
    required String deviceId,
    required DateTime startDate,
    required DateTime endDate,
  });
  Stream<HealthData> getHealthDataStream(String deviceId);
  Future<void> syncHealthData(String deviceId);
  
  /// Fitness Activities
  Future<List<FitnessActivity>> getFitnessActivities({
    required String deviceId,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<FitnessActivity?> getCurrentActivity(String deviceId);
  Future<void> startWorkoutTracking(String deviceId, WorkoutType type);
  Future<void> stopWorkoutTracking(String deviceId);
  Stream<FitnessActivity> getFitnessActivityStream(String deviceId);
  
  /// Notifications
  Future<void> sendNotificationToWearable({
    required String deviceId,
    required NotificationType type,
    required String title,
    required String message,
    String? actionData,
  });
  Future<List<SmartWatchNotification>> getPendingNotifications(String deviceId);
  Future<void> markNotificationAsRead(String notificationId);
  
  /// Order Integration
  Future<void> sendOrderUpdate({
    required String deviceId,
    required String orderId,
    required String status,
    String? restaurantName,
    String? estimatedTime,
  });
  Future<void> scheduleOrderReminder({
    required String deviceId,
    required OrderReminder reminder,
  });
  Future<void> sendQuickOrderSuggestion({
    required String deviceId,
    required String restaurantId,
    required String itemName,
    required double price,
  });
  
  /// Settings
  Future<WearableSettings> getDeviceSettings(String deviceId);
  Future<void> updateDeviceSettings(String deviceId, WearableSettings settings);
  Future<void> enableFeature(String deviceId, WearableCapability capability);
  Future<void> disableFeature(String deviceId, WearableCapability capability);
  
  /// Nutrition Goals
  Future<List<NutritionGoal>> getNutritionGoals(String userId);
  Future<void> createNutritionGoal(NutritionGoal goal);
  Future<void> updateNutritionGoal(String goalId, int currentValue);
  Future<void> deleteNutritionGoal(String goalId);
  
  /// Voice Commands
  Future<bool> isVoiceCommandSupported(String deviceId);
  Future<void> enableVoiceCommands(String deviceId);
  Future<void> processVoiceCommand(String deviceId, String command);
  
  /// Battery and Status
  Future<double> getBatteryLevel(String deviceId);
  Future<ConnectionStatus> getConnectionStatus(String deviceId);
  Future<DateTime> getLastSyncTime(String deviceId);
  Future<void> forceSyncDevice(String deviceId);
  
  /// Heart Rate Monitoring
  Future<int?> getCurrentHeartRate(String deviceId);
  Stream<int> getHeartRateStream(String deviceId);
  Future<List<HeartRateZone>> getHeartRateZones(String activityId);
  
  /// Step Counting
  Future<int> getTodaySteps(String deviceId);
  Future<int> getStepsForDate(String deviceId, DateTime date);
  Stream<int> getStepsStream(String deviceId);
  
  /// Sleep Tracking
  Future<Map<String, dynamic>> getLastNightSleep(String deviceId);
  Future<List<Map<String, dynamic>>> getSleepHistory({
    required String deviceId,
    required DateTime startDate,
    required DateTime endDate,
  });
  
  /// Water and Hydration
  Future<void> logWaterIntake(String deviceId, double amount);
  Future<double> getTodayWaterIntake(String deviceId);
  Future<void> setHydrationReminder(String deviceId, Duration interval);
  
  /// Quick Actions
  Future<void> sendQuickReply(String deviceId, String message);
  Future<void> triggerSOS(String deviceId);
  Future<void> findMyPhone(String deviceId);
  
  /// Data Export
  Future<Map<String, dynamic>> exportHealthData({
    required String deviceId,
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<void> importHealthData(String deviceId, Map<String, dynamic> data);
  
  /// Device Calibration
  Future<void> calibrateSteps(String deviceId);
  Future<void> calibrateHeartRate(String deviceId);
  Future<bool> isCalibrationNeeded(String deviceId);
  
  /// Firmware Updates
  Future<String?> checkFirmwareUpdate(String deviceId);
  Future<void> updateFirmware(String deviceId);
  Future<bool> isFirmwareUpdateInProgress(String deviceId);
  
  /// Privacy and Security
  Future<void> enableDataEncryption(String deviceId);
  Future<void> clearStoredData(String deviceId);
  Future<void> anonymizeData(String deviceId);
  
  /// Dispose
  Future<void> dispose();
}