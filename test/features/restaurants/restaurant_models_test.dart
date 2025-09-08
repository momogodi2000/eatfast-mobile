import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/features/restaurants/domain/models/restaurant.dart';
import 'package:eatfast_mobile/features/restaurants/domain/models/menu_item.dart';
import 'package:eatfast_mobile/features/restaurants/domain/models/restaurant_review.dart';

void main() {
  group('Restaurant Models Tests', () {
    test('Restaurant model should create correctly', () {
      // Arrange
      final now = DateTime.now();
      final openingHours = {
        'monday': '09:00-22:00',
        'tuesday': '09:00-22:00',
        'wednesday': '09:00-22:00',
        'thursday': '09:00-22:00',
        'friday': '09:00-23:00',
        'saturday': '10:00-23:00',
        'sunday': '10:00-22:00',
      };

      // Act
      const restaurant = Restaurant(
        id: '1',
        name: 'Chez Marie',
        description: 'Traditional Cameroonian cuisine with modern twist',
        address: '123 Main Street, Yaoundé',
        phone: '+237123456789',
        email: 'contact@chezmarie.cm',
        latitude: 3.8667,
        longitude: 11.5167,
        cuisineType: 'Cameroonian',
        priceRange: 2,
        rating: 4.5,
        reviewCount: 128,
        imageUrl: 'https://example.com/restaurant.jpg',
        images: ['https://example.com/image1.jpg', 'https://example.com/image2.jpg'],
        isOpen: true,
        openingHours: openingHours,
        deliveryTime: 30,
        deliveryFee: 1500,
        minimumOrder: 5000,
        isFeatured: true,
        tags: ['traditional', 'modern', 'authentic'],
        createdAt: null,
        updatedAt: null,
      );

      // Assert
      expect(restaurant.id, '1');
      expect(restaurant.name, 'Chez Marie');
      expect(restaurant.description, 'Traditional Cameroonian cuisine with modern twist');
      expect(restaurant.address, '123 Main Street, Yaoundé');
      expect(restaurant.phone, '+237123456789');
      expect(restaurant.email, 'contact@chezmarie.cm');
      expect(restaurant.latitude, 3.8667);
      expect(restaurant.longitude, 11.5167);
      expect(restaurant.cuisineType, 'Cameroonian');
      expect(restaurant.priceRange, 2);
      expect(restaurant.rating, 4.5);
      expect(restaurant.reviewCount, 128);
      expect(restaurant.imageUrl, 'https://example.com/restaurant.jpg');
      expect(restaurant.images.length, 2);
      expect(restaurant.isOpen, true);
      expect(restaurant.openingHours, openingHours);
      expect(restaurant.deliveryTime, 30);
      expect(restaurant.deliveryFee, 1500);
      expect(restaurant.minimumOrder, 5000);
      expect(restaurant.isFeatured, true);
      expect(restaurant.tags.length, 3);
      expect(restaurant.displayPriceRange, '€€');
      expect(restaurant.isHighlyRated, true);
    });

    test('MenuItem model should create correctly', () {
      // Arrange & Act
      const menuItem = MenuItem(
        id: '1',
        restaurantId: 'restaurant_123',
        name: 'Ndolé',
        description: 'Traditional Cameroonian dish with bitter leaves and peanuts',
        price: 8500,
        imageUrl: 'https://example.com/ndole.jpg',
        category: 'Main Course',
        isAvailable: true,
        isVegetarian: false,
        isVegan: false,
        isGlutenFree: false,
        allergens: ['peanuts', 'fish'],
        preparationTime: 25,
        calories: 450,
        nutritionalInfo: {
          'protein': '25g',
          'carbs': '35g',
          'fat': '20g',
        },
        ingredients: ['bitter leaves', 'peanuts', 'fish', 'onions', 'garlic'],
        isPopular: true,
        isChefSpecial: false,
        discountPercentage: 0,
        originalPrice: 8500,
      );

      // Assert
      expect(menuItem.id, '1');
      expect(menuItem.restaurantId, 'restaurant_123');
      expect(menuItem.name, 'Ndolé');
      expect(menuItem.description, 'Traditional Cameroonian dish with bitter leaves and peanuts');
      expect(menuItem.price, 8500);
      expect(menuItem.imageUrl, 'https://example.com/ndole.jpg');
      expect(menuItem.category, 'Main Course');
      expect(menuItem.isAvailable, true);
      expect(menuItem.isVegetarian, false);
      expect(menuItem.isVegan, false);
      expect(menuItem.isGlutenFree, false);
      expect(menuItem.allergens.length, 2);
      expect(menuItem.preparationTime, 25);
      expect(menuItem.calories, 450);
      expect(menuItem.nutritionalInfo.length, 3);
      expect(menuItem.ingredients.length, 5);
      expect(menuItem.isPopular, true);
      expect(menuItem.isChefSpecial, false);
      expect(menuItem.discountPercentage, 0);
      expect(menuItem.originalPrice, 8500);
      expect(menuItem.hasDiscount, false);
      expect(menuItem.discountedPrice, 8500);
    });

    test('RestaurantReview model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      const review = RestaurantReview(
        id: '1',
        userId: 'user123',
        userName: 'Jean Dupont',
        userAvatar: 'https://example.com/avatar.jpg',
        restaurantId: 'restaurant_456',
        rating: 5,
        comment: 'Excellent food and great service! The Ndolé was perfectly prepared.',
        createdAt: null,
        updatedAt: null,
        orderId: 'order_789',
        helpful: 12,
        images: ['https://example.com/review1.jpg'],
        isVerified: true,
      );

      // Assert
      expect(review.id, '1');
      expect(review.userId, 'user123');
      expect(review.userName, 'Jean Dupont');
      expect(review.userAvatar, 'https://example.com/avatar.jpg');
      expect(review.restaurantId, 'restaurant_456');
      expect(review.rating, 5);
      expect(review.comment, 'Excellent food and great service! The Ndolé was perfectly prepared.');
      expect(review.orderId, 'order_789');
      expect(review.helpful, 12);
      expect(review.images.length, 1);
      expect(review.isVerified, true);
      expect(review.isPositive, true);
    });

    test('MenuItem with discount should calculate correctly', () {
      // Arrange & Act
      const discountedItem = MenuItem(
        id: '2',
        restaurantId: 'restaurant_123',
        name: 'Discounted Item',
        description: 'Item with discount',
        price: 6800,
        imageUrl: null,
        category: 'Main Course',
        isAvailable: true,
        isVegetarian: false,
        isVegan: false,
        isGlutenFree: false,
        allergens: [],
        preparationTime: 15,
        calories: 300,
        nutritionalInfo: {},
        ingredients: ['ingredient1', 'ingredient2'],
        isPopular: false,
        isChefSpecial: false,
        discountPercentage: 20,
        originalPrice: 8500,
      );

      // Assert
      expect(discountedItem.hasDiscount, true);
      expect(discountedItem.discountedPrice, 6800);
      expect(discountedItem.discountAmount, 1700);
    });
  });

  group('Restaurant Business Logic Tests', () {
    test('Restaurant price range display should work correctly', () {
      // Test different price ranges
      const cheapRestaurant = Restaurant(
        id: '1',
        name: 'Cheap Eats',
        description: 'Budget friendly',
        address: '123 Street',
        phone: '+237123456789',
        email: 'cheap@example.com',
        latitude: 0.0,
        longitude: 0.0,
        cuisineType: 'Fast Food',
        priceRange: 1,
        rating: 3.5,
        reviewCount: 50,
        imageUrl: null,
        images: [],
        isOpen: true,
        openingHours: {},
        deliveryTime: 20,
        deliveryFee: 1000,
        minimumOrder: 3000,
        isFeatured: false,
        tags: [],
        createdAt: null,
        updatedAt: null,
      );

      const expensiveRestaurant = Restaurant(
        id: '2',
        name: 'Fine Dining',
        description: 'Upscale dining',
        address: '456 Avenue',
        phone: '+237987654321',
        email: 'fine@example.com',
        latitude: 0.0,
        longitude: 0.0,
        cuisineType: 'French',
        priceRange: 4,
        rating: 4.8,
        reviewCount: 200,
        imageUrl: null,
        images: [],
        isOpen: true,
        openingHours: {},
        deliveryTime: 45,
        deliveryFee: 3000,
        minimumOrder: 15000,
        isFeatured: true,
        tags: [],
        createdAt: null,
        updatedAt: null,
      );

      expect(cheapRestaurant.displayPriceRange, '€');
      expect(expensiveRestaurant.displayPriceRange, '€€€€');
    });

    test('Restaurant rating classification should work correctly', () {
      // Test rating classifications
      const lowRated = Restaurant(
        id: '1',
        name: 'Low Rated',
        description: 'Test',
        address: 'Test',
        phone: '+237123456789',
        email: 'test@example.com',
        latitude: 0.0,
        longitude: 0.0,
        cuisineType: 'Test',
        priceRange: 2,
        rating: 3.2,
        reviewCount: 10,
        imageUrl: null,
        images: [],
        isOpen: true,
        openingHours: {},
        deliveryTime: 30,
        deliveryFee: 1500,
        minimumOrder: 5000,
        isFeatured: false,
        tags: [],
        createdAt: null,
        updatedAt: null,
      );

      const highlyRated = Restaurant(
        id: '2',
        name: 'Highly Rated',
        description: 'Test',
        address: 'Test',
        phone: '+237123456789',
        email: 'test@example.com',
        latitude: 0.0,
        longitude: 0.0,
        cuisineType: 'Test',
        priceRange: 2,
        rating: 4.5,
        reviewCount: 100,
        imageUrl: null,
        images: [],
        isOpen: true,
        openingHours: {},
        deliveryTime: 30,
        deliveryFee: 1500,
        minimumOrder: 5000,
        isFeatured: false,
        tags: [],
        createdAt: null,
        updatedAt: null,
      );

      expect(lowRated.isHighlyRated, false);
      expect(highlyRated.isHighlyRated, true);
    });

    test('MenuItem nutritional information should be accessible', () {
      // Test nutritional info access
      const item = MenuItem(
        id: '1',
        restaurantId: 'restaurant_123',
        name: 'Healthy Salad',
        description: 'Fresh and healthy',
        price: 6500,
        imageUrl: null,
        category: 'Salads',
        isAvailable: true,
        isVegetarian: true,
        isVegan: true,
        isGlutenFree: true,
        allergens: [],
        preparationTime: 10,
        calories: 250,
        nutritionalInfo: {
          'protein': '15g',
          'carbs': '20g',
          'fat': '8g',
          'fiber': '5g',
        },
        ingredients: ['lettuce', 'tomatoes', 'cucumber', 'olive oil'],
        isPopular: true,
        isChefSpecial: false,
        discountPercentage: 0,
        originalPrice: 6500,
      );

      expect(item.nutritionalInfo['protein'], '15g');
      expect(item.nutritionalInfo['carbs'], '20g');
      expect(item.nutritionalInfo['fat'], '8g');
      expect(item.nutritionalInfo['fiber'], '5g');
      expect(item.isVegetarian, true);
      expect(item.isVegan, true);
      expect(item.isGlutenFree, true);
    });
  });
}
