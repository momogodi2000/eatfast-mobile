import '../../features/restaurants/domain/models/restaurant.dart';
import '../../features/restaurants/domain/models/menu_item.dart';

class MockRestaurantData {
  static final List<Restaurant> restaurants = [
    Restaurant(
      id: 'rest_1',
      name: 'Chez Tante Marie',
      description: 'Restaurant traditionnel camerounais spécialisé dans les plats authentiques du terroir.',
      imageUrl: 'assets/images/restaurants/chez_tante_marie.jpg',
      cuisineTypes: ['Camerounaise', 'Traditionnelle'],
      rating: 4.7,
      reviewCount: 234,
      priceRange: '€€',
      estimatedDeliveryTime: 35,
      deliveryFee: 500,
      isOpen: true,
      address: const RestaurantAddress(
        street: 'Rue de la Réunification',
        city: 'Douala',
        district: 'Akwa',
        postalCode: '1234',
        latitude: 4.0511,
        longitude: 9.7679,
        landmark: 'Près du marché central',
      ),
      operatingHours: ['11:00-22:00'],
      phoneNumber: '+237699123456',
      specialties: ['Ndolé', 'Eru', 'Poisson braisé'],
      isPromoted: true,
      paymentMethods: ['MTN Mobile Money', 'Orange Money', 'Espèces'],
    ),
    Restaurant(
      id: 'rest_2',
      name: 'Fast Bite',
      description: 'Restaurant de fast-food moderne avec des options rapides et délicieuses.',
      imageUrl: 'assets/images/restaurants/fast_bite.jpg',
      cuisineTypes: ['Fast Food', 'International'],
      rating: 4.3,
      reviewCount: 156,
      priceRange: '€',
      estimatedDeliveryTime: 25,
      deliveryFee: 300,
      isOpen: true,
      address: const RestaurantAddress(
        street: 'Avenue Charles de Gaulle',
        city: 'Douala',
        district: 'Bonapriso',
        postalCode: '1235',
        latitude: 4.0615,
        longitude: 9.7011,
      ),
      operatingHours: ['10:00-23:00'],
      phoneNumber: '+237699234567',
      specialties: ['Burgers', 'Pizza', 'Poulet frit'],
      paymentMethods: ['MTN Mobile Money', 'Orange Money', 'EU Mobile', 'Espèces'],
    ),
    Restaurant(
      id: 'rest_3',
      name: 'Le Petit Gourmet',
      description: 'Cuisine française raffinée avec une touche camerounaise.',
      imageUrl: 'assets/images/restaurants/le_petit_gourmet.jpg',
      cuisineTypes: ['Française', 'Fusion'],
      rating: 4.8,
      reviewCount: 89,
      priceRange: '€€€',
      estimatedDeliveryTime: 45,
      deliveryFee: 800,
      isOpen: false,
      address: const RestaurantAddress(
        street: 'Rue Joss',
        city: 'Douala',
        district: 'Bonanjo',
        postalCode: '1236',
        latitude: 4.0496,
        longitude: 9.6928,
      ),
      operatingHours: ['18:00-23:00'],
      phoneNumber: '+237699345678',
      specialties: ['Coq au vin', 'Ratatouille', 'Crème brûlée'],
      paymentMethods: ['MTN Mobile Money', 'Orange Money'],
    ),
    Restaurant(
      id: 'rest_4',
      name: 'Mama Africa Kitchen',
      description: 'Saveurs panafricaines avec une spécialité camerounaise.',
      imageUrl: 'assets/images/restaurants/mama_africa.jpg',
      cuisineTypes: ['Africaine', 'Camerounaise'],
      rating: 4.5,
      reviewCount: 178,
      priceRange: '€€',
      estimatedDeliveryTime: 40,
      deliveryFee: 600,
      isOpen: true,
      address: const RestaurantAddress(
        street: 'Boulevard de la Liberté',
        city: 'Douala',
        district: 'New Bell',
        postalCode: '1237',
        latitude: 4.0733,
        longitude: 9.7433,
      ),
      operatingHours: ['12:00-21:00'],
      phoneNumber: '+237699456789',
      specialties: ['Jollof Rice', 'Suya', 'Plantain frit'],
      isFavorite: true,
      paymentMethods: ['MTN Mobile Money', 'Orange Money', 'Espèces'],
    ),
    Restaurant(
      id: 'rest_5',
      name: 'Pizza Corner',
      description: 'Les meilleures pizzas de Douala avec des ingrédients frais.',
      imageUrl: 'assets/images/restaurants/pizza_corner.jpg',
      cuisineTypes: ['Italienne', 'Pizza'],
      rating: 4.2,
      reviewCount: 203,
      priceRange: '€€',
      estimatedDeliveryTime: 30,
      deliveryFee: 400,
      isOpen: true,
      address: const RestaurantAddress(
        street: 'Rue de Nkololoun',
        city: 'Yaoundé',
        district: 'Centre-ville',
        postalCode: '1238',
        latitude: 3.8480,
        longitude: 11.5021,
      ),
      operatingHours: ['11:00-22:30'],
      phoneNumber: '+237699567890',
      specialties: ['Pizza Margherita', 'Pizza 4 Saisons', 'Calzone'],
      paymentMethods: ['MTN Mobile Money', 'Orange Money', 'EU Mobile'],
    ),
  ];

  static final List<MenuCategory> menuCategories = [
    const MenuCategory(
      id: 'cat_1',
      restaurantId: 'rest_1',
      name: 'Plats Traditionnels',
      description: 'Nos spécialités camerounaises authentiques',
      imageUrl: 'assets/images/categories/traditional.jpg',
      sortOrder: 1,
    ),
    const MenuCategory(
      id: 'cat_2',
      restaurantId: 'rest_1',
      name: 'Poissons & Viandes',
      description: 'Poissons et viandes grillés à la perfection',
      imageUrl: 'assets/images/categories/meat_fish.jpg',
      sortOrder: 2,
    ),
    const MenuCategory(
      id: 'cat_3',
      restaurantId: 'rest_1',
      name: 'Accompagnements',
      description: 'Riz, plantain, igname et autres',
      imageUrl: 'assets/images/categories/sides.jpg',
      sortOrder: 3,
    ),
    const MenuCategory(
      id: 'cat_4',
      restaurantId: 'rest_2',
      name: 'Burgers',
      description: 'Nos burgers signature',
      imageUrl: 'assets/images/categories/burgers.jpg',
      sortOrder: 1,
    ),
    const MenuCategory(
      id: 'cat_5',
      restaurantId: 'rest_2',
      name: 'Pizzas',
      description: 'Pizzas fraîches et croustillantes',
      imageUrl: 'assets/images/categories/pizza.jpg',
      sortOrder: 2,
    ),
  ];

  static final List<MenuItem> menuItems = [
    // Chez Tante Marie - Plats Traditionnels
    MenuItem(
      id: 'item_1',
      restaurantId: 'rest_1',
      name: 'Ndolé Complet',
      description: 'Plat traditionnel aux feuilles de ndolé, arachides, poisson et viande',
      price: 2500,
      imageUrl: 'assets/images/menu/ndole.jpg',
      categoryId: 'cat_1',
      allergens: ['Arachides'],
      dietaryTags: [DietaryTag.glutenFree],
      preparationTime: 25,
      calories: 450,
      isPopular: true,
      customizations: [
        MenuItemCustomization(
          id: 'cust_1',
          name: 'Type de viande',
          type: 'single',
          isRequired: true,
          options: [
            CustomizationOption(
              id: 'opt_1',
              name: 'Bœuf',
              additionalPrice: 0,
            ),
            CustomizationOption(
              id: 'opt_2',
              name: 'Porc',
              additionalPrice: 200,
            ),
            CustomizationOption(
              id: 'opt_3',
              name: 'Poisson',
              additionalPrice: 300,
            ),
          ],
        ),
        MenuItemCustomization(
          id: 'cust_2',
          name: 'Niveau de piment',
          type: 'single',
          isRequired: false,
          options: [
            CustomizationOption(
              id: 'opt_4',
              name: 'Pas de piment',
              additionalPrice: 0,
            ),
            CustomizationOption(
              id: 'opt_5',
              name: 'Peu pimenté',
              additionalPrice: 0,
            ),
            CustomizationOption(
              id: 'opt_6',
              name: 'Très pimenté',
              additionalPrice: 0,
            ),
          ],
        ),
      ],
    ),
    MenuItem(
      id: 'item_2',
      restaurantId: 'rest_1',
      name: 'Eru avec Waterleaf',
      description: 'Soupe traditionnelle aux feuilles d\'eru et waterleaf',
      price: 2200,
      imageUrl: 'assets/images/menu/eru.jpg',
      categoryId: 'cat_1',
      dietaryTags: [DietaryTag.vegetarian, DietaryTag.healthy],
      preparationTime: 30,
      calories: 380,
      customizations: [
        MenuItemCustomization(
          id: 'cust_3',
          name: 'Accompagnement',
          type: 'single',
          isRequired: true,
          options: [
            CustomizationOption(
              id: 'opt_7',
              name: 'Riz blanc',
              additionalPrice: 0,
            ),
            CustomizationOption(
              id: 'opt_8',
              name: 'Plantain bouilli',
              additionalPrice: 100,
            ),
            CustomizationOption(
              id: 'opt_9',
              name: 'Igname pilée',
              additionalPrice: 150,
            ),
          ],
        ),
      ],
    ),
    MenuItem(
      id: 'item_3',
      restaurantId: 'rest_1',
      name: 'Poisson Braisé',
      description: 'Poisson frais grillé aux épices camerounaises',
      price: 3000,
      imageUrl: 'assets/images/menu/poisson_braise.jpg',
      categoryId: 'cat_2',
      dietaryTags: [DietaryTag.glutenFree, DietaryTag.healthy],
      preparationTime: 20,
      calories: 320,
      isRecommended: true,
    ),
    // Fast Bite - Burgers
    MenuItem(
      id: 'item_4',
      restaurantId: 'rest_2',
      name: 'Big Bite Burger',
      description: 'Double steak, fromage, salade, tomate, oignon, sauce spéciale',
      price: 1800,
      imageUrl: 'assets/images/menu/big_bite_burger.jpg',
      categoryId: 'cat_4',
      allergens: ['Gluten', 'Lactose'],
      preparationTime: 15,
      calories: 650,
      isPopular: true,
      customizations: [
        MenuItemCustomization(
          id: 'cust_4',
          name: 'Cuisson de la viande',
          type: 'single',
          isRequired: true,
          options: [
            CustomizationOption(
              id: 'opt_10',
              name: 'Saignant',
              additionalPrice: 0,
            ),
            CustomizationOption(
              id: 'opt_11',
              name: 'À point',
              additionalPrice: 0,
            ),
            CustomizationOption(
              id: 'opt_12',
              name: 'Bien cuit',
              additionalPrice: 0,
            ),
          ],
        ),
        MenuItemCustomization(
          id: 'cust_5',
          name: 'Extras',
          type: 'multiple',
          isRequired: false,
          options: [
            CustomizationOption(
              id: 'opt_13',
              name: 'Bacon',
              additionalPrice: 300,
            ),
            CustomizationOption(
              id: 'opt_14',
              name: 'Fromage supplémentaire',
              additionalPrice: 200,
            ),
            CustomizationOption(
              id: 'opt_15',
              name: 'Avocat',
              additionalPrice: 250,
            ),
          ],
        ),
      ],
    ),
    MenuItem(
      id: 'item_5',
      restaurantId: 'rest_2',
      name: 'Pizza Margherita',
      description: 'Base tomate, mozzarella, basilic frais, huile d\'olive',
      price: 2200,
      imageUrl: 'assets/images/menu/pizza_margherita.jpg',
      categoryId: 'cat_5',
      allergens: ['Gluten', 'Lactose'],
      dietaryTags: [DietaryTag.vegetarian],
      preparationTime: 18,
      calories: 520,
      customizations: [
        MenuItemCustomization(
          id: 'cust_6',
          name: 'Taille',
          type: 'single',
          isRequired: true,
          options: [
            CustomizationOption(
              id: 'opt_16',
              name: 'Petite (25cm)',
              additionalPrice: 0,
            ),
            CustomizationOption(
              id: 'opt_17',
              name: 'Moyenne (30cm)',
              additionalPrice: 500,
            ),
            CustomizationOption(
              id: 'opt_18',
              name: 'Grande (35cm)',
              additionalPrice: 1000,
            ),
          ],
        ),
        MenuItemCustomization(
          id: 'cust_7',
          name: 'Ingrédients supplémentaires',
          type: 'multiple',
          isRequired: false,
          options: [
            CustomizationOption(
              id: 'opt_19',
              name: 'Champignons',
              additionalPrice: 200,
            ),
            CustomizationOption(
              id: 'opt_20',
              name: 'Olives',
              additionalPrice: 150,
            ),
            CustomizationOption(
              id: 'opt_21',
              name: 'Poivrons',
              additionalPrice: 150,
            ),
          ],
        ),
      ],
    ),
  ];

  // Cuisine types for filtering
  static const List<String> cuisineTypes = [
    'Camerounaise',
    'Traditionnelle',
    'Fast Food',
    'International',
    'Française',
    'Fusion',
    'Africaine',
    'Italienne',
    'Pizza',
  ];

  // Price ranges
  static const List<String> priceRanges = ['€', '€€', '€€€', '€€€€'];

  static Restaurant? getRestaurantById(String id) {
    try {
      return restaurants.firstWhere((restaurant) => restaurant.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<MenuCategory> getCategoriesForRestaurant(String restaurantId) {
    return menuCategories
        .where((category) => category.restaurantId == restaurantId)
        .toList();
  }

  static List<MenuItem> getMenuItemsForCategory(String categoryId) {
    return menuItems
        .where((item) => item.categoryId == categoryId)
        .toList();
  }

  static List<MenuItem> getMenuItemsForRestaurant(String restaurantId) {
    return menuItems
        .where((item) => item.restaurantId == restaurantId)
        .toList();
  }
}