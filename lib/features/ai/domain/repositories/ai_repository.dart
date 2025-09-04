import '../../../../core/result.dart';
import '../models/personalization.dart';
import '../models/smart_features.dart';

abstract class AIRepository {
  // User Preferences & Personalization
  Future<Result<UserPreferences, String>> getUserPreferences(String userId);
  Future<Result<UserPreferences, String>> updateUserPreferences(String userId, UserPreferences preferences);
  Future<Result<UserBehavior, String>> getUserBehavior(String userId);
  Future<Result<void, String>> recordUserInteraction(String userId, String interactionType, Map<String, dynamic> data);
  
  // Smart Recommendations
  Future<Result<List<SmartRecommendation>, String>> getPersonalizedRecommendations(
    String userId, {
    RecommendationType? type,
    int? limit,
    Map<String, dynamic>? context,
  });
  Future<Result<PersonalizedFeed, String>> getPersonalizedFeed(String userId);
  Future<Result<List<RecommendedItem>, String>> getSimilarItems(String itemId, String userId);
  Future<Result<List<RecommendedItem>, String>> getComplementaryItems(List<String> itemIds, String userId);
  
  // Smart Ordering
  Future<Result<SmartOrder, String>> generateSmartOrder(String userId, Map<String, dynamic> context);
  Future<Result<List<SmartOrderItem>, String>> getFrequentlyOrderedItems(String userId, {String? restaurantId});
  Future<Result<void, String>> recordOrderFeedback(String userId, String orderId, bool wasHelpful, String? feedback);
  
  // Weather-Based Suggestions
  Future<Result<WeatherBasedSuggestion, String>> getWeatherBasedSuggestions(
    String userId,
    double latitude,
    double longitude,
  );
  Future<Result<List<SuggestedDish>, String>> getWeatherAppropriateItems(
    WeatherCondition weather,
    double temperature, {
    String? userId,
  });
  
  // Predictive Analytics
  Future<Result<PredictiveAnalytics, String>> getPredictiveAnalytics(String userId);
  Future<Result<List<OrderPrediction>, String>> getNextOrderPredictions(String userId, {int? limit});
  Future<Result<ChurnPrediction, String>> getChurnPrediction(String userId);
  Future<Result<LifetimeValuePrediction, String>> getLifetimeValuePrediction(String userId);
  
  // Smart Notifications
  Future<Result<List<SmartNotification>, String>> getSmartNotifications(String userId);
  Future<Result<SmartNotification, String>> scheduleSmartNotification(SmartNotification notification);
  Future<Result<void, String>> markNotificationAsRead(String notificationId);
  Future<Result<void, String>> updateNotificationPreferences(String userId, Map<String, bool> preferences);
  
  // AI Insights
  Future<Result<List<AIInsight>, String>> getAIInsights(String userId, {InsightType? type});
  Future<Result<void, String>> dismissInsight(String insightId);
  Future<Result<void, String>> provideInsightFeedback(String insightId, bool wasUseful, String? feedback);
  
  // Content Personalization
  Future<Result<List<String>, String>> getPersonalizedSearchSuggestions(String userId, String query);
  Future<Result<Map<String, dynamic>, String>> getPersonalizedHomePage(String userId);
  Future<Result<List<String>, String>> getPersonalizedCategories(String userId);
  
  // Machine Learning Training
  Future<Result<void, String>> submitTrainingData(String userId, String dataType, Map<String, dynamic> data);
  Future<Result<void, String>> updateUserEmbedding(String userId);
  Future<Result<Map<String, double>, String>> getUserSimilarityScores(String userId, List<String> targetUserIds);
  
  // Real-time Personalization
  Stream<List<SmartRecommendation>> watchPersonalizedRecommendations(String userId);
  Stream<PersonalizedFeed> watchPersonalizedFeed(String userId);
  Stream<List<SmartNotification>> watchSmartNotifications(String userId);
  Stream<List<AIInsight>> watchAIInsights(String userId);
  
  // A/B Testing & Experimentation
  Future<Result<String, String>> getExperimentVariant(String userId, String experimentId);
  Future<Result<void, String>> recordExperimentConversion(String userId, String experimentId, String variant, String event);
  Future<Result<Map<String, dynamic>, String>> getPersonalizationConfig(String userId);
  
  // Contextual Intelligence
  Future<Result<Map<String, dynamic>, String>> getContextualRecommendations(
    String userId,
    String context, // 'time_of_day', 'weather', 'location', 'social'
    Map<String, dynamic> contextData,
  );
  Future<Result<List<String>, String>> getSmartFilters(String userId, String category);
  Future<Result<Map<String, dynamic>, String>> getSmartSortingCriteria(String userId, String context);
  
  // Feedback Learning
  Future<Result<void, String>> recordRecommendationClick(String userId, String recommendationId, String itemId);
  Future<Result<void, String>> recordRecommendationSkip(String userId, String recommendationId);
  Future<Result<void, String>> recordSearchResultClick(String userId, String query, String itemId, int position);
  Future<Result<void, String>> recordRestaurantVisit(String userId, String restaurantId, Duration visitDuration);
  
  // Advanced Personalization Features
  Future<Result<List<String>, String>> getPersonalizedDeals(String userId);
  Future<Result<Map<String, dynamic>, String>> getOptimalDeliveryTime(String userId);
  Future<Result<List<String>, String>> getPersonalizedPaymentMethods(String userId);
  Future<Result<Map<String, dynamic>, String>> getSmartReorderSuggestions(String userId);
}