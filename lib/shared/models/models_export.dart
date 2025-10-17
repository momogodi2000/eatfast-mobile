/// Models Export - Centralized exports for all data models
/// Import this file to get access to all model classes
///
/// Usage:
/// ```dart
/// import 'package:eatfast_mobile/shared/models/models_export.dart';
/// ```
library;

// Core Models
// export 'models/api_responses.dart' hide LoyaltyReward, OrderStatusUpdate; // Commented out to avoid conflicts
export 'restaurant_models.dart';
export 'loyalty_models.dart';
export 'user_address.dart'; // UserAddress model
// Note: wallet_models.dart has ambiguous exports (PaymentMethod, TransactionType)
// Import it directly when needed: import 'package:eatfast_mobile/shared/models/wallet_models.dart';

// Service Models - can be imported individually when needed
// Auth Models (User model is in auth/models/app_user.dart)
export '../services/auth/models/app_user.dart';
export '../services/auth/domain/models/two_factor_auth.dart';
export '../services/auth/domain/models/login_request.dart';
export '../services/auth/domain/models/register_request.dart';

// Payment Models - Use payment_exports.dart for comprehensive payment models
// Or import specific files to avoid ambiguous exports:
// import 'package:eatfast_mobile/shared/services/payment/domain/models/payment.dart';
export '../services/payment/domain/models/payment_exceptions.dart';
export '../services/payment/domain/models/mobile_money_response.dart';

// Order Models
export '../services/orders/domain/models/order.dart';
export '../services/orders/domain/models/scheduled_order.dart';

// Cart Models
export '../services/cart/domain/models/cart.dart';

// Restaurant Models (from services) - canonical Restaurant model
export '../services/restaurants/domain/models/menu_item.dart';
// Note: Restaurant is defined in multiple places, import specifically:
// import 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant.dart';
export '../services/restaurants/domain/models/restaurant_review.dart';

// Analytics Models
export '../services/analytics/domain/models/analytics.dart';
// Note: analytics_models.dart contains duplicate LoyaltyTransaction - use loyalty models instead
export '../services/analytics/domain/models/analytics_data.dart';

// Loyalty Models - canonical source for Loyalty models
// Note: LoyaltyReward and LoyaltyTransaction defined in multiple places
// Use specific imports when needed to avoid ambiguity

// Wallet Models - canonical source for Wallet models
export '../services/wallet/domain/models/wallet.dart';

// Promotions Models
export '../services/promotions/domain/models/promo_code.dart';

// Ratings Models
export '../services/ratings/domain/models/rating.dart';

// Chat Models (communication uses whatsapp_message.dart)
export '../services/chat/domain/models/chat_message.dart';

// Tips Models
export '../services/tips/domain/models/tip.dart';

// Subscription Models
export '../services/subscription/domain/models/subscription.dart';
