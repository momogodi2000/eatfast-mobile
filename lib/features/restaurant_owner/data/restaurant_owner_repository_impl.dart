import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import '../../../core/result.dart';
import '../../../core/services/api/api_client.dart';
import '../domain/models/restaurant_stats.dart';
import '../domain/models/live_order.dart';
import '../domain/models/menu_management.dart';
import '../domain/repositories/restaurant_owner_repository.dart';

class RestaurantOwnerRepositoryImpl implements RestaurantOwnerRepository {
  final ApiClient _apiClient = ApiClient();
  final Map<String, StreamController<List<LiveOrder>>> _liveOrderControllers = {};

  @override
  Future<Result<RestaurantStats, String>> getDashboardStats(String restaurantId) async {
    try {
      // Backend uses auth token to identify restaurant, not URL param
      final response = await _apiClient.get('/restaurant/analytics/dashboard');

      if (response.statusCode == 200) {
        return Result.success(RestaurantStats.fromJson(response.data));
      } else {
        return Result.failure('Erreur lors de la récupération des statistiques');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<List<HourlyStats>, String>> getHourlyStats(String restaurantId, DateTime date) async {
    try {
      // Backend uses auth token, hourly stats from analytics dashboard
      final response = await _apiClient.get(
        '/restaurant/analytics/dashboard',
        queryParameters: {'date': date.toIso8601String()},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['hourly_stats'] ?? [];
        final stats = data.map((json) => HourlyStats.fromJson(json)).toList();
        return Result.success(stats);
      } else {
        return Result.failure('Erreur lors de la récupération des statistiques horaires');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<List<DailyStats>, String>> getWeeklyStats(String restaurantId) async {
    try {
      // Backend provides weekly stats in analytics dashboard
      final response = await _apiClient.get('/restaurant/analytics/dashboard');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['daily_stats'] ?? [];
        final stats = data.map((json) => DailyStats.fromJson(json)).toList();
        return Result.success(stats);
      } else {
        return Result.failure('Erreur lors de la récupération des statistiques hebdomadaires');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<List<LiveOrder>, String>> getLiveOrders(String restaurantId) async {
    try {
      // Backend route: GET /restaurant/orders/current
      final response = await _apiClient.get('/restaurant/orders/current');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['orders'] ?? [];
        final orders = data.map((json) => LiveOrder.fromJson(json)).toList();
        return Result.success(orders);
      } else {
        return Result.failure('Erreur lors de la récupération des commandes');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Stream<List<LiveOrder>> watchLiveOrders(String restaurantId) {
    if (_liveOrderControllers[restaurantId] == null) {
      _liveOrderControllers[restaurantId] = StreamController<List<LiveOrder>>.broadcast();
      _initializeWebSocket(restaurantId);
    }
    
    return _liveOrderControllers[restaurantId]!.stream;
  }

  void _initializeWebSocket(String restaurantId) async {
    try {
      // Initialize with current orders
      final initialOrders = await getLiveOrders(restaurantId);
      initialOrders.when(
        success: (orders) {
          _liveOrderControllers[restaurantId]?.add(orders);
        },
        failure: (error) {
          _liveOrderControllers[restaurantId]?.addError(error);
        },
      );

      // TODO: Implement WebSocket connection for real-time updates
      // For now, polling every 30 seconds
      Timer.periodic(const Duration(seconds: 30), (timer) {
        if (_liveOrderControllers[restaurantId]?.isClosed ?? true) {
          timer.cancel();
          return;
        }
        
        getLiveOrders(restaurantId).then((result) {
          result.when(
            success: (orders) {
              _liveOrderControllers[restaurantId]?.add(orders);
            },
            failure: (error) {
              _liveOrderControllers[restaurantId]?.addError(error);
            },
          );
        });
      });
    } catch (e) {
      _liveOrderControllers[restaurantId]?.addError(e);
    }
  }

  @override
  Future<Result<LiveOrder, String>> acceptOrder(String orderId, int estimatedPrepTime) async {
    try {
      final response = await _apiClient.post('/orders/$orderId/accept', data: {
        'estimated_prep_time': estimatedPrepTime,
      });
      
      if (response.statusCode == 200) {
        return Result.success(LiveOrder.fromJson(response.data['order']));
      } else {
        return Result.failure('Erreur lors de l\'acceptation de la commande');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<LiveOrder, String>> rejectOrder(String orderId, String reason) async {
    try {
      final response = await _apiClient.post('/orders/$orderId/reject', data: {
        'reason': reason,
      });
      
      if (response.statusCode == 200) {
        return Result.success(LiveOrder.fromJson(response.data['order']));
      } else {
        return Result.failure('Erreur lors du rejet de la commande');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<LiveOrder, String>> updateOrderStatus(String orderId, OrderStatus status) async {
    try {
      final response = await _apiClient.put('/orders/$orderId/status', data: {
        'status': status.name,
      });
      
      if (response.statusCode == 200) {
        return Result.success(LiveOrder.fromJson(response.data['order']));
      } else {
        return Result.failure('Erreur lors de la mise à jour du statut');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> updatePreparationTime(String orderId, int newPrepTime) async {
    try {
      final response = await _apiClient.put('/orders/$orderId/prep-time', data: {
        'preparation_time': newPrepTime,
      });
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la mise à jour du temps de préparation');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<List<MenuCategory>, String>> getMenuCategories(String restaurantId) async {
    try {
      // Backend route: GET /restaurant/menus
      final response = await _apiClient.get('/restaurant/menus');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['categories'] ?? response.data['menus'] ?? [];
        final categories = data.map((json) => MenuCategory.fromJson(json)).toList();
        return Result.success(categories);
      } else {
        return Result.failure('Erreur lors de la récupération du menu');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<MenuCategory, String>> createMenuCategory(String restaurantId, MenuCategory category) async {
    try {
      // Backend route: POST /restaurant/menus
      final response = await _apiClient.post('/restaurant/menus',
        data: category.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Result.success(MenuCategory.fromJson(response.data['category'] ?? response.data['menu']));
      } else {
        return Result.failure('Erreur lors de la création de la catégorie');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<MenuCategory, String>> updateMenuCategory(MenuCategory category) async {
    try {
      // Backend route: PUT /restaurant/menus/:menuId
      final response = await _apiClient.put('/restaurant/menus/${category.categoryId}',
        data: category.toJson(),
      );

      if (response.statusCode == 200) {
        return Result.success(MenuCategory.fromJson(response.data['category'] ?? response.data['menu']));
      } else {
        return Result.failure('Erreur lors de la mise à jour de la catégorie');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> deleteMenuCategory(String categoryId) async {
    try {
      // Backend route: DELETE /restaurant/menus/:menuId
      final response = await _apiClient.delete('/restaurant/menus/$categoryId');

      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la suppression de la catégorie');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> reorderCategories(String restaurantId, List<String> categoryIds) async {
    try {
      final response = await _apiClient.put('/restaurant/$restaurantId/menu/categories/reorder', 
        data: {'category_ids': categoryIds},
      );
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la réorganisation des catégories');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<MenuItemDetails, String>> createMenuItem(String categoryId, MenuItemDetails item) async {
    try {
      final response = await _apiClient.post('/menu/categories/$categoryId/items', 
        data: item.toJson(),
      );
      
      if (response.statusCode == 201) {
        return Result.success(MenuItemDetails.fromJson(response.data['item']));
      } else {
        return Result.failure('Erreur lors de la création de l\'article');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<MenuItemDetails, String>> updateMenuItem(MenuItemDetails item) async {
    try {
      final response = await _apiClient.put('/menu/items/${item.itemId}', 
        data: item.toJson(),
      );
      
      if (response.statusCode == 200) {
        return Result.success(MenuItemDetails.fromJson(response.data['item']));
      } else {
        return Result.failure('Erreur lors de la mise à jour de l\'article');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> deleteMenuItem(String itemId) async {
    try {
      final response = await _apiClient.delete('/menu/items/$itemId');
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la suppression de l\'article');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> toggleItemAvailability(String itemId, bool isAvailable) async {
    try {
      final response = await _apiClient.put('/menu/items/$itemId/availability', 
        data: {'is_available': isAvailable},
      );
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la mise à jour de la disponibilité');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> bulkUpdateAvailability(List<String> itemIds, bool isAvailable) async {
    try {
      final response = await _apiClient.put('/menu/items/bulk/availability', 
        data: {
          'item_ids': itemIds,
          'is_available': isAvailable,
        },
      );
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la mise à jour en lot');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<String, String>> uploadItemImage(String itemId, File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imageFile.path),
        'item_id': itemId,
      });
      
      final response = await _apiClient.post('/menu/items/$itemId/image', data: formData);
      
      if (response.statusCode == 200) {
        return Result.success(response.data['image_url']);
      } else {
        return Result.failure('Erreur lors du téléchargement de l\'image');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<String, String>> uploadCategoryImage(String categoryId, File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imageFile.path),
        'category_id': categoryId,
      });
      
      final response = await _apiClient.post('/menu/categories/$categoryId/image', data: formData);
      
      if (response.statusCode == 200) {
        return Result.success(response.data['image_url']);
      } else {
        return Result.failure('Erreur lors du téléchargement de l\'image');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> deleteImage(String imageUrl) async {
    try {
      final response = await _apiClient.delete('/images/delete', 
        data: {'image_url': imageUrl},
      );
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la suppression de l\'image');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<List<MenuItemPerformance>, String>> getItemPerformance(String restaurantId) async {
    try {
      // Backend route: GET /restaurant/analytics/dashboard contains item performance
      final response = await _apiClient.get('/restaurant/analytics/dashboard');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['performance'] ?? response.data['item_performance'] ?? [];
        final performance = data.map((json) => MenuItemPerformance.fromJson(json)).toList();
        return Result.success(performance);
      } else {
        return Result.failure('Erreur lors de la récupération des performances');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<Map<String, dynamic>, String>> getRevenueAnalytics(String restaurantId, DateTime from, DateTime to) async {
    try {
      // Backend route: GET /restaurant/reports/financial with date range
      final response = await _apiClient.get('/restaurant/reports/financial',
        queryParameters: {
          'from': from.toIso8601String(),
          'to': to.toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return Result.success(response.data);
      } else {
        return Result.failure('Erreur lors de la récupération des revenus');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<List<PopularItem>, String>> getPopularItems(String restaurantId) async {
    try {
      // Backend route: GET /restaurant/analytics/dashboard contains popular items
      final response = await _apiClient.get('/restaurant/analytics/dashboard');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['popular_items'] ?? [];
        final items = data.map((json) => PopularItem.fromJson(json)).toList();
        return Result.success(items);
      } else {
        return Result.failure('Erreur lors de la récupération des articles populaires');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<Map<String, dynamic>, String>> getRestaurantProfile(String restaurantId) async {
    try {
      // Backend route: GET /restaurant/profile (uses auth token)
      final response = await _apiClient.get('/restaurant/profile');

      if (response.statusCode == 200) {
        return Result.success(response.data);
      } else {
        return Result.failure('Erreur lors de la récupération du profil');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> updateRestaurantProfile(String restaurantId, Map<String, dynamic> data) async {
    try {
      // Backend route: PUT /restaurant/profile (uses auth token)
      final response = await _apiClient.put('/restaurant/profile', data: data);

      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la mise à jour du profil');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> updateBusinessHours(String restaurantId, Map<String, dynamic> hours) async {
    try {
      final response = await _apiClient.put('/restaurant/$restaurantId/hours', data: hours);
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la mise à jour des horaires');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> updateDeliveryRadius(String restaurantId, double radius) async {
    try {
      final response = await _apiClient.put('/restaurant/$restaurantId/delivery-radius', 
        data: {'radius': radius},
      );
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors de la mise à jour du rayon de livraison');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<void, String>> markNotificationAsRead(String notificationId) async {
    try {
      final response = await _apiClient.put('/notifications/$notificationId/read');
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Erreur lors du marquage de la notification');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getNotifications(String restaurantId) async {
    try {
      // Backend route: GET /notifications (general endpoint for authenticated user)
      final response = await _apiClient.get('/notifications');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['notifications'] ?? [];
        return Result.success(List<Map<String, dynamic>>.from(data));
      } else {
        return Result.failure('Erreur lors de la récupération des notifications');
      }
    } catch (e) {
      return Result.failure('Erreur de connexion: $e');
    }
  }

  void dispose() {
    for (final controller in _liveOrderControllers.values) {
      controller.close();
    }
    _liveOrderControllers.clear();
  }
}