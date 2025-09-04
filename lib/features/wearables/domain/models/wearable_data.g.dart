// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wearable_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WearableDeviceImpl _$$WearableDeviceImplFromJson(Map<String, dynamic> json) =>
    _$WearableDeviceImpl(
      deviceId: json['deviceId'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$WearableTypeEnumMap, json['type']),
      brand: $enumDecode(_$WearableBrandEnumMap, json['brand']),
      modelName: json['modelName'] as String,
      connectionStatus:
          $enumDecode(_$ConnectionStatusEnumMap, json['connectionStatus']),
      batteryLevel: (json['batteryLevel'] as num).toDouble(),
      lastSyncTime: DateTime.parse(json['lastSyncTime'] as String),
      firmwareVersion: json['firmwareVersion'] as String?,
      serialNumber: json['serialNumber'] as String?,
      capabilities: (json['capabilities'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$WearableCapabilityEnumMap, e))
              .toList() ??
          const [],
      isEnabled: json['isEnabled'] as bool? ?? true,
      settings: json['settings'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$WearableDeviceImplToJson(
        _$WearableDeviceImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'name': instance.name,
      'type': _$WearableTypeEnumMap[instance.type]!,
      'brand': _$WearableBrandEnumMap[instance.brand]!,
      'modelName': instance.modelName,
      'connectionStatus': _$ConnectionStatusEnumMap[instance.connectionStatus]!,
      'batteryLevel': instance.batteryLevel,
      'lastSyncTime': instance.lastSyncTime.toIso8601String(),
      'firmwareVersion': instance.firmwareVersion,
      'serialNumber': instance.serialNumber,
      'capabilities': instance.capabilities
          .map((e) => _$WearableCapabilityEnumMap[e]!)
          .toList(),
      'isEnabled': instance.isEnabled,
      'settings': instance.settings,
    };

const _$WearableTypeEnumMap = {
  WearableType.smartwatch: 'smartwatch',
  WearableType.fitnessTracker: 'fitness_tracker',
  WearableType.smartRing: 'smart_ring',
  WearableType.smartGlasses: 'smart_glasses',
  WearableType.earbuds: 'earbuds',
};

const _$WearableBrandEnumMap = {
  WearableBrand.apple: 'apple',
  WearableBrand.samsung: 'samsung',
  WearableBrand.garmin: 'garmin',
  WearableBrand.fitbit: 'fitbit',
  WearableBrand.huawei: 'huawei',
  WearableBrand.xiaomi: 'xiaomi',
  WearableBrand.polar: 'polar',
  WearableBrand.oura: 'oura',
  WearableBrand.google: 'google',
  WearableBrand.other: 'other',
};

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.connected: 'connected',
  ConnectionStatus.connecting: 'connecting',
  ConnectionStatus.disconnected: 'disconnected',
  ConnectionStatus.error: 'error',
  ConnectionStatus.pairing: 'pairing',
};

const _$WearableCapabilityEnumMap = {
  WearableCapability.heartRate: 'heart_rate',
  WearableCapability.stepCounting: 'step_counting',
  WearableCapability.sleepTracking: 'sleep_tracking',
  WearableCapability.gps: 'gps',
  WearableCapability.notifications: 'notifications',
  WearableCapability.voiceControl: 'voice_control',
  WearableCapability.nfcPayments: 'nfc_payments',
  WearableCapability.temperature: 'temperature',
  WearableCapability.bloodOxygen: 'blood_oxygen',
  WearableCapability.stressMonitoring: 'stress_monitoring',
  WearableCapability.workoutTracking: 'workout_tracking',
};

_$HealthDataImpl _$$HealthDataImplFromJson(Map<String, dynamic> json) =>
    _$HealthDataImpl(
      deviceId: json['deviceId'] as String,
      userId: json['userId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      heartRate: (json['heartRate'] as num?)?.toInt(),
      steps: (json['steps'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toDouble(),
      calories: (json['calories'] as num?)?.toInt(),
      sleepMinutes: (json['sleepMinutes'] as num?)?.toInt(),
      bodyTemperature: (json['bodyTemperature'] as num?)?.toDouble(),
      bloodOxygen: (json['bloodOxygen'] as num?)?.toInt(),
      systolicPressure: (json['systolicPressure'] as num?)?.toInt(),
      diastolicPressure: (json['diastolicPressure'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      bodyFat: (json['bodyFat'] as num?)?.toDouble(),
      stressLevel: (json['stressLevel'] as num?)?.toInt(),
      additionalMetrics: json['additionalMetrics'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$HealthDataImplToJson(_$HealthDataImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'userId': instance.userId,
      'timestamp': instance.timestamp.toIso8601String(),
      'heartRate': instance.heartRate,
      'steps': instance.steps,
      'distance': instance.distance,
      'calories': instance.calories,
      'sleepMinutes': instance.sleepMinutes,
      'bodyTemperature': instance.bodyTemperature,
      'bloodOxygen': instance.bloodOxygen,
      'systolicPressure': instance.systolicPressure,
      'diastolicPressure': instance.diastolicPressure,
      'weight': instance.weight,
      'bodyFat': instance.bodyFat,
      'stressLevel': instance.stressLevel,
      'additionalMetrics': instance.additionalMetrics,
    };

_$FitnessActivityImpl _$$FitnessActivityImplFromJson(
        Map<String, dynamic> json) =>
    _$FitnessActivityImpl(
      activityId: json['activityId'] as String,
      deviceId: json['deviceId'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      duration: (json['duration'] as num).toInt(),
      steps: (json['steps'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toDouble(),
      calories: (json['calories'] as num?)?.toInt(),
      averageHeartRate: (json['averageHeartRate'] as num?)?.toInt(),
      maxHeartRate: (json['maxHeartRate'] as num?)?.toInt(),
      heartRateZones: (json['heartRateZones'] as List<dynamic>?)
          ?.map((e) => HeartRateZone.fromJson(e as Map<String, dynamic>))
          .toList(),
      route: json['route'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$FitnessActivityImplToJson(
        _$FitnessActivityImpl instance) =>
    <String, dynamic>{
      'activityId': instance.activityId,
      'deviceId': instance.deviceId,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'duration': instance.duration,
      'steps': instance.steps,
      'distance': instance.distance,
      'calories': instance.calories,
      'averageHeartRate': instance.averageHeartRate,
      'maxHeartRate': instance.maxHeartRate,
      'heartRateZones': instance.heartRateZones,
      'route': instance.route,
      'additionalData': instance.additionalData,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.walking: 'walking',
  ActivityType.running: 'running',
  ActivityType.cycling: 'cycling',
  ActivityType.swimming: 'swimming',
  ActivityType.workout: 'workout',
  ActivityType.yoga: 'yoga',
  ActivityType.meditation: 'meditation',
  ActivityType.other: 'other',
};

_$SmartWatchNotificationImpl _$$SmartWatchNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$SmartWatchNotificationImpl(
      notificationId: json['notificationId'] as String,
      deviceId: json['deviceId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      title: json['title'] as String,
      message: json['message'] as String,
      scheduledTime: json['scheduledTime'] == null
          ? null
          : DateTime.parse(json['scheduledTime'] as String),
      isSent: json['isSent'] as bool? ?? false,
      isRead: json['isRead'] as bool? ?? false,
      actionData: json['actionData'] as String?,
      customData: json['customData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SmartWatchNotificationImplToJson(
        _$SmartWatchNotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'deviceId': instance.deviceId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'message': instance.message,
      'scheduledTime': instance.scheduledTime?.toIso8601String(),
      'isSent': instance.isSent,
      'isRead': instance.isRead,
      'actionData': instance.actionData,
      'customData': instance.customData,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.orderPlaced: 'order_placed',
  NotificationType.orderConfirmed: 'order_confirmed',
  NotificationType.orderPreparing: 'order_preparing',
  NotificationType.orderReady: 'order_ready',
  NotificationType.deliveryStarted: 'delivery_started',
  NotificationType.deliveryArrived: 'delivery_arrived',
  NotificationType.mealReminder: 'meal_reminder',
  NotificationType.hydrationReminder: 'hydration_reminder',
  NotificationType.nutritionGoal: 'nutrition_goal',
  NotificationType.promotion: 'promotion',
};

_$OrderReminderImpl _$$OrderReminderImplFromJson(Map<String, dynamic> json) =>
    _$OrderReminderImpl(
      orderId: json['orderId'] as String,
      deviceId: json['deviceId'] as String,
      restaurantName: json['restaurantName'] as String,
      reminderTime: DateTime.parse(json['reminderTime'] as String),
      type: $enumDecode(_$ReminderTypeEnumMap, json['type']),
      message: json['message'] as String?,
      isSent: json['isSent'] as bool? ?? false,
      isAcknowledged: json['isAcknowledged'] as bool? ?? false,
    );

Map<String, dynamic> _$$OrderReminderImplToJson(_$OrderReminderImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'deviceId': instance.deviceId,
      'restaurantName': instance.restaurantName,
      'reminderTime': instance.reminderTime.toIso8601String(),
      'type': _$ReminderTypeEnumMap[instance.type]!,
      'message': instance.message,
      'isSent': instance.isSent,
      'isAcknowledged': instance.isAcknowledged,
    };

const _$ReminderTypeEnumMap = {
  ReminderType.mealTime: 'meal_time',
  ReminderType.orderSuggestion: 'order_suggestion',
  ReminderType.hydration: 'hydration',
  ReminderType.medication: 'medication',
  ReminderType.activity: 'activity',
};

_$WearableSettingsImpl _$$WearableSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$WearableSettingsImpl(
      deviceId: json['deviceId'] as String,
      userId: json['userId'] as String,
      enableHealthTracking: json['enableHealthTracking'] as bool? ?? true,
      enableOrderNotifications:
          json['enableOrderNotifications'] as bool? ?? true,
      enableFitnessTracking: json['enableFitnessTracking'] as bool? ?? true,
      enableQuickOrders: json['enableQuickOrders'] as bool? ?? true,
      syncIntervalMinutes: (json['syncIntervalMinutes'] as num?)?.toInt() ?? 30,
      enabledNotificationTypes:
          (json['enabledNotificationTypes'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      customSettings:
          json['customSettings'] as Map<String, dynamic>? ?? const {},
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$WearableSettingsImplToJson(
        _$WearableSettingsImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'userId': instance.userId,
      'enableHealthTracking': instance.enableHealthTracking,
      'enableOrderNotifications': instance.enableOrderNotifications,
      'enableFitnessTracking': instance.enableFitnessTracking,
      'enableQuickOrders': instance.enableQuickOrders,
      'syncIntervalMinutes': instance.syncIntervalMinutes,
      'enabledNotificationTypes': instance.enabledNotificationTypes,
      'customSettings': instance.customSettings,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$WearableWorkoutImpl _$$WearableWorkoutImplFromJson(
        Map<String, dynamic> json) =>
    _$WearableWorkoutImpl(
      workoutId: json['workoutId'] as String,
      deviceId: json['deviceId'] as String,
      type: $enumDecode(_$WorkoutTypeEnumMap, json['type']),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      duration: (json['duration'] as num).toInt(),
      calories: (json['calories'] as num?)?.toInt(),
      averageHeartRate: (json['averageHeartRate'] as num?)?.toInt(),
      maxHeartRate: (json['maxHeartRate'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toDouble(),
      intervals: (json['intervals'] as List<dynamic>?)
          ?.map((e) => WorkoutInterval.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$WearableWorkoutImplToJson(
        _$WearableWorkoutImpl instance) =>
    <String, dynamic>{
      'workoutId': instance.workoutId,
      'deviceId': instance.deviceId,
      'type': _$WorkoutTypeEnumMap[instance.type]!,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'duration': instance.duration,
      'calories': instance.calories,
      'averageHeartRate': instance.averageHeartRate,
      'maxHeartRate': instance.maxHeartRate,
      'distance': instance.distance,
      'intervals': instance.intervals,
      'summary': instance.summary,
    };

const _$WorkoutTypeEnumMap = {
  WorkoutType.cardio: 'cardio',
  WorkoutType.strength: 'strength',
  WorkoutType.flexibility: 'flexibility',
  WorkoutType.sports: 'sports',
  WorkoutType.outdoor: 'outdoor',
  WorkoutType.indoor: 'indoor',
};

_$WorkoutIntervalImpl _$$WorkoutIntervalImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutIntervalImpl(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      duration: (json['duration'] as num).toInt(),
      heartRate: (json['heartRate'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toDouble(),
      calories: (json['calories'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$WorkoutIntervalImplToJson(
        _$WorkoutIntervalImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'duration': instance.duration,
      'heartRate': instance.heartRate,
      'distance': instance.distance,
      'calories': instance.calories,
      'notes': instance.notes,
    };

_$HeartRateZoneImpl _$$HeartRateZoneImplFromJson(Map<String, dynamic> json) =>
    _$HeartRateZoneImpl(
      zoneName: json['zoneName'] as String,
      minHeartRate: (json['minHeartRate'] as num).toInt(),
      maxHeartRate: (json['maxHeartRate'] as num).toInt(),
      timeInZone: (json['timeInZone'] as num).toInt(),
      percentageOfWorkout: (json['percentageOfWorkout'] as num).toDouble(),
    );

Map<String, dynamic> _$$HeartRateZoneImplToJson(_$HeartRateZoneImpl instance) =>
    <String, dynamic>{
      'zoneName': instance.zoneName,
      'minHeartRate': instance.minHeartRate,
      'maxHeartRate': instance.maxHeartRate,
      'timeInZone': instance.timeInZone,
      'percentageOfWorkout': instance.percentageOfWorkout,
    };

_$NutritionGoalImpl _$$NutritionGoalImplFromJson(Map<String, dynamic> json) =>
    _$NutritionGoalImpl(
      goalId: json['goalId'] as String,
      userId: json['userId'] as String,
      deviceId: json['deviceId'] as String,
      type: $enumDecode(_$GoalTypeEnumMap, json['type']),
      targetValue: (json['targetValue'] as num).toInt(),
      currentValue: (json['currentValue'] as num).toInt(),
      goalDate: DateTime.parse(json['goalDate'] as String),
      isAchieved: json['isAchieved'] as bool? ?? false,
      notes: json['notes'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$NutritionGoalImplToJson(_$NutritionGoalImpl instance) =>
    <String, dynamic>{
      'goalId': instance.goalId,
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'type': _$GoalTypeEnumMap[instance.type]!,
      'targetValue': instance.targetValue,
      'currentValue': instance.currentValue,
      'goalDate': instance.goalDate.toIso8601String(),
      'isAchieved': instance.isAchieved,
      'notes': instance.notes,
      'additionalData': instance.additionalData,
    };

const _$GoalTypeEnumMap = {
  GoalType.calories: 'calories',
  GoalType.protein: 'protein',
  GoalType.carbs: 'carbs',
  GoalType.fat: 'fat',
  GoalType.water: 'water',
  GoalType.steps: 'steps',
  GoalType.weight: 'weight',
};
