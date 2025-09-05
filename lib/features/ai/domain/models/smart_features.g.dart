// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_features.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmartOrderImpl _$$SmartOrderImplFromJson(Map<String, dynamic> json) =>
    _$SmartOrderImpl(
      userId: json['userId'] as String,
      sessionId: json['sessionId'] as String,
      predictedItems: (json['predictedItems'] as List<dynamic>)
          .map((e) => SmartOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderContext: json['orderContext'] as Map<String, dynamic>,
      confidence: (json['confidence'] as num).toDouble(),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      restaurantId: json['restaurantId'] as String?,
      estimatedTotal: (json['estimatedTotal'] as num?)?.toDouble(),
      estimatedDeliveryTime: (json['estimatedDeliveryTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SmartOrderImplToJson(_$SmartOrderImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'sessionId': instance.sessionId,
      'predictedItems': instance.predictedItems,
      'orderContext': instance.orderContext,
      'confidence': instance.confidence,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'restaurantId': instance.restaurantId,
      'estimatedTotal': instance.estimatedTotal,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
    };

_$SmartOrderItemImpl _$$SmartOrderItemImplFromJson(Map<String, dynamic> json) =>
    _$SmartOrderItemImpl(
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      restaurantId: json['restaurantId'] as String,
      predictedQuantity: (json['predictedQuantity'] as num).toInt(),
      confidence: (json['confidence'] as num).toDouble(),
      reasons:
          (json['reasons'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      suggestedCustomizations:
          (json['suggestedCustomizations'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$$SmartOrderItemImplToJson(
        _$SmartOrderItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'restaurantId': instance.restaurantId,
      'predictedQuantity': instance.predictedQuantity,
      'confidence': instance.confidence,
      'reasons': instance.reasons,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'suggestedCustomizations': instance.suggestedCustomizations,
    };

_$WeatherBasedSuggestionImpl _$$WeatherBasedSuggestionImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherBasedSuggestionImpl(
      weatherCondition:
          $enumDecode(_$WeatherConditionEnumMap, json['weatherCondition']),
      temperature: (json['temperature'] as num).toDouble(),
      temperatureUnit: json['temperatureUnit'] as String,
      suggestedDishes: (json['suggestedDishes'] as List<dynamic>)
          .map((e) => SuggestedDish.fromJson(e as Map<String, dynamic>))
          .toList(),
      reasoning: json['reasoning'] as String,
      validUntil: json['validUntil'] == null
          ? null
          : DateTime.parse(json['validUntil'] as String),
    );

Map<String, dynamic> _$$WeatherBasedSuggestionImplToJson(
        _$WeatherBasedSuggestionImpl instance) =>
    <String, dynamic>{
      'weatherCondition': _$WeatherConditionEnumMap[instance.weatherCondition]!,
      'temperature': instance.temperature,
      'temperatureUnit': instance.temperatureUnit,
      'suggestedDishes': instance.suggestedDishes,
      'reasoning': instance.reasoning,
      'validUntil': instance.validUntil?.toIso8601String(),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.sunny: 'sunny',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.stormy: 'stormy',
  WeatherCondition.snowy: 'snowy',
  WeatherCondition.hot: 'hot',
  WeatherCondition.cold: 'cold',
  WeatherCondition.humid: 'humid',
};

_$SuggestedDishImpl _$$SuggestedDishImplFromJson(Map<String, dynamic> json) =>
    _$SuggestedDishImpl(
      dishId: json['dishId'] as String,
      name: json['name'] as String,
      restaurantName: json['restaurantName'] as String,
      relevanceScore: (json['relevanceScore'] as num).toDouble(),
      reason: json['reason'] as String,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      estimatedDeliveryTime: (json['estimatedDeliveryTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SuggestedDishImplToJson(_$SuggestedDishImpl instance) =>
    <String, dynamic>{
      'dishId': instance.dishId,
      'name': instance.name,
      'restaurantName': instance.restaurantName,
      'relevanceScore': instance.relevanceScore,
      'reason': instance.reason,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
    };

_$SmartNotificationImpl _$$SmartNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$SmartNotificationImpl(
      notificationId: json['notificationId'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      title: json['title'] as String,
      message: json['message'] as String,
      trigger: $enumDecode(_$NotificationTriggerEnumMap, json['trigger']),
      scheduledFor: DateTime.parse(json['scheduledFor'] as String),
      actionText: json['actionText'] as String?,
      actionRoute: json['actionRoute'] as String?,
      actionData: json['actionData'] as Map<String, dynamic>?,
      status:
          $enumDecodeNullable(_$NotificationStatusEnumMap, json['status']) ??
              NotificationStatus.pending,
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
    );

Map<String, dynamic> _$$SmartNotificationImplToJson(
        _$SmartNotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'userId': instance.userId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'message': instance.message,
      'trigger': _$NotificationTriggerEnumMap[instance.trigger]!,
      'scheduledFor': instance.scheduledFor.toIso8601String(),
      'actionText': instance.actionText,
      'actionRoute': instance.actionRoute,
      'actionData': instance.actionData,
      'status': _$NotificationStatusEnumMap[instance.status]!,
      'sentAt': instance.sentAt?.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.recommendation: 'recommendation',
  NotificationType.reminder: 'reminder',
  NotificationType.deal: 'deal',
  NotificationType.loyalty: 'loyalty',
  NotificationType.reorder: 'reorder',
  NotificationType.retention: 'retention',
};

const _$NotificationTriggerEnumMap = {
  NotificationTrigger.timeBased: 'time_based',
  NotificationTrigger.behaviorBased: 'behavior_based',
  NotificationTrigger.locationBased: 'location_based',
  NotificationTrigger.weatherBased: 'weather_based',
  NotificationTrigger.eventBased: 'event_based',
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.pending: 'pending',
  NotificationStatus.sent: 'sent',
  NotificationStatus.delivered: 'delivered',
  NotificationStatus.read: 'read',
  NotificationStatus.expired: 'expired',
  NotificationStatus.failed: 'failed',
};

_$PredictiveAnalyticsImpl _$$PredictiveAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictiveAnalyticsImpl(
      userId: json['userId'] as String,
      insights:
          PredictiveInsights.fromJson(json['insights'] as Map<String, dynamic>),
      churnPredictions: (json['churnPredictions'] as List<dynamic>)
          .map((e) => ChurnPrediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextOrderPredictions: (json['nextOrderPredictions'] as List<dynamic>)
          .map((e) => OrderPrediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      lifetimeValue: LifetimeValuePrediction.fromJson(
          json['lifetimeValue'] as Map<String, dynamic>),
      lastAnalyzed: json['lastAnalyzed'] == null
          ? null
          : DateTime.parse(json['lastAnalyzed'] as String),
    );

Map<String, dynamic> _$$PredictiveAnalyticsImplToJson(
        _$PredictiveAnalyticsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'insights': instance.insights,
      'churnPredictions': instance.churnPredictions,
      'nextOrderPredictions': instance.nextOrderPredictions,
      'lifetimeValue': instance.lifetimeValue,
      'lastAnalyzed': instance.lastAnalyzed?.toIso8601String(),
    };

_$PredictiveInsightsImpl _$$PredictiveInsightsImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictiveInsightsImpl(
      nextOrderProbability: (json['nextOrderProbability'] as num).toDouble(),
      daysUntilNextOrder: (json['daysUntilNextOrder'] as num).toInt(),
      churnRisk: (json['churnRisk'] as num).toDouble(),
      preferredRestaurants: (json['preferredRestaurants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cuisineAffinities:
          (json['cuisineAffinities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      optimalOrderTime: OptimalOrderTime.fromJson(
          json['optimalOrderTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PredictiveInsightsImplToJson(
        _$PredictiveInsightsImpl instance) =>
    <String, dynamic>{
      'nextOrderProbability': instance.nextOrderProbability,
      'daysUntilNextOrder': instance.daysUntilNextOrder,
      'churnRisk': instance.churnRisk,
      'preferredRestaurants': instance.preferredRestaurants,
      'cuisineAffinities': instance.cuisineAffinities,
      'optimalOrderTime': instance.optimalOrderTime,
    };

_$ChurnPredictionImpl _$$ChurnPredictionImplFromJson(
        Map<String, dynamic> json) =>
    _$ChurnPredictionImpl(
      churnProbability: (json['churnProbability'] as num).toDouble(),
      riskFactors: (json['riskFactors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      suggestedActions: (json['suggestedActions'] as List<dynamic>)
          .map((e) => RetentionAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      daysToChurn: (json['daysToChurn'] as num).toInt(),
      predictedChurnDate: json['predictedChurnDate'] == null
          ? null
          : DateTime.parse(json['predictedChurnDate'] as String),
    );

Map<String, dynamic> _$$ChurnPredictionImplToJson(
        _$ChurnPredictionImpl instance) =>
    <String, dynamic>{
      'churnProbability': instance.churnProbability,
      'riskFactors': instance.riskFactors,
      'suggestedActions': instance.suggestedActions,
      'daysToChurn': instance.daysToChurn,
      'predictedChurnDate': instance.predictedChurnDate?.toIso8601String(),
    };

_$OrderPredictionImpl _$$OrderPredictionImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderPredictionImpl(
      predictedOrderTime: DateTime.parse(json['predictedOrderTime'] as String),
      probability: (json['probability'] as num).toDouble(),
      likelyItems: (json['likelyItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      likelyRestaurant: json['likelyRestaurant'] as String,
      estimatedOrderValue: (json['estimatedOrderValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderPredictionImplToJson(
        _$OrderPredictionImpl instance) =>
    <String, dynamic>{
      'predictedOrderTime': instance.predictedOrderTime.toIso8601String(),
      'probability': instance.probability,
      'likelyItems': instance.likelyItems,
      'likelyRestaurant': instance.likelyRestaurant,
      'estimatedOrderValue': instance.estimatedOrderValue,
    };

_$LifetimeValuePredictionImpl _$$LifetimeValuePredictionImplFromJson(
        Map<String, dynamic> json) =>
    _$LifetimeValuePredictionImpl(
      predictedLifetimeValue:
          (json['predictedLifetimeValue'] as num).toDouble(),
      confidence: (json['confidence'] as num).toDouble(),
      predictedOrderCount: (json['predictedOrderCount'] as num).toInt(),
      averagePredictedOrderValue:
          (json['averagePredictedOrderValue'] as num).toDouble(),
      timeHorizonMonths: (json['timeHorizonMonths'] as num).toInt(),
    );

Map<String, dynamic> _$$LifetimeValuePredictionImplToJson(
        _$LifetimeValuePredictionImpl instance) =>
    <String, dynamic>{
      'predictedLifetimeValue': instance.predictedLifetimeValue,
      'confidence': instance.confidence,
      'predictedOrderCount': instance.predictedOrderCount,
      'averagePredictedOrderValue': instance.averagePredictedOrderValue,
      'timeHorizonMonths': instance.timeHorizonMonths,
    };

_$RetentionActionImpl _$$RetentionActionImplFromJson(
        Map<String, dynamic> json) =>
    _$RetentionActionImpl(
      type: $enumDecode(_$RetentionActionTypeEnumMap, json['type']),
      description: json['description'] as String,
      expectedImpact: (json['expectedImpact'] as num).toDouble(),
      priority: (json['priority'] as num).toInt(),
      parameters: json['parameters'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$RetentionActionImplToJson(
        _$RetentionActionImpl instance) =>
    <String, dynamic>{
      'type': _$RetentionActionTypeEnumMap[instance.type]!,
      'description': instance.description,
      'expectedImpact': instance.expectedImpact,
      'priority': instance.priority,
      'parameters': instance.parameters,
    };

const _$RetentionActionTypeEnumMap = {
  RetentionActionType.discountOffer: 'discount_offer',
  RetentionActionType.loyaltyPoints: 'loyalty_points',
  RetentionActionType.personalizedRecommendation: 'personalized_recommendation',
  RetentionActionType.freeDelivery: 'free_delivery',
  RetentionActionType.exclusiveContent: 'exclusive_content',
  RetentionActionType.reminderNotification: 'reminder_notification',
};

_$OptimalOrderTimeImpl _$$OptimalOrderTimeImplFromJson(
        Map<String, dynamic> json) =>
    _$OptimalOrderTimeImpl(
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$OptimalOrderTimeImplToJson(
        _$OptimalOrderTimeImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'daysOfWeek': instance.daysOfWeek,
      'confidence': instance.confidence,
    };

_$AIInsightImpl _$$AIInsightImplFromJson(Map<String, dynamic> json) =>
    _$AIInsightImpl(
      insightId: json['insightId'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$InsightTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      supportingData: (json['supportingData'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      generatedAt: json['generatedAt'] == null
          ? null
          : DateTime.parse(json['generatedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      isActionable: json['isActionable'] as bool? ?? false,
      recommendedAction: json['recommendedAction'] as String?,
    );

Map<String, dynamic> _$$AIInsightImplToJson(_$AIInsightImpl instance) =>
    <String, dynamic>{
      'insightId': instance.insightId,
      'userId': instance.userId,
      'type': _$InsightTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'confidence': instance.confidence,
      'supportingData': instance.supportingData,
      'generatedAt': instance.generatedAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'isActionable': instance.isActionable,
      'recommendedAction': instance.recommendedAction,
    };

const _$InsightTypeEnumMap = {
  InsightType.spendingPattern: 'spending_pattern',
  InsightType.orderTiming: 'order_timing',
  InsightType.cuisinePreference: 'cuisine_preference',
  InsightType.restaurantLoyalty: 'restaurant_loyalty',
  InsightType.priceSensitivity: 'price_sensitivity',
  InsightType.deliveryPreference: 'delivery_preference',
};
