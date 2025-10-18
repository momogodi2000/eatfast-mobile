/// Centralized export file for all shared models
/// Single source of truth for model imports across the app
library;

// Restaurant models
export 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant.dart';
export 'package:eatfast_mobile/shared/services/restaurants/domain/models/menu_item.dart';
export 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant_review.dart';

// User and Auth models
export 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';
export 'package:eatfast_mobile/shared/models/user_address.dart';

// Order models
export 'package:eatfast_mobile/shared/services/orders/domain/models/order.dart';
export 'package:eatfast_mobile/shared/services/orders/domain/models/order_status.dart';

// Payment models
export 'package:eatfast_mobile/shared/services/payment/domain/models/payment_method.dart';
export 'package:eatfast_mobile/shared/services/payment/domain/models/payment_response.dart';

// Cart models
export 'package:eatfast_mobile/shared/services/cart/domain/models/cart.dart';
export 'package:eatfast_mobile/shared/services/cart/domain/models/cart_item.dart';

// Widgets
export 'package:eatfast_mobile/shared/widgets/common/app_loading_indicator.dart';

// Guest models
export 'package:eatfast_mobile/modules/guest_module/providers/domain/models/guest_models.dart';

// Loyalty models
export 'package:eatfast_mobile/shared/models/loyalty_models.dart';

// Rating models
export 'package:eatfast_mobile/shared/services/ratings/domain/models/rating.dart';

// Wallet models (hiding PaymentMethod to avoid conflict with payment/domain/models)
export 'package:eatfast_mobile/shared/models/wallet_models.dart' hide PaymentMethod;

// Analytics models
export 'package:eatfast_mobile/shared/models/analytics_data.dart';
export 'package:eatfast_mobile/shared/models/analytics_request.dart';

// Driver models
export 'package:eatfast_mobile/shared/models/driver_profile.dart';
export 'package:eatfast_mobile/shared/models/driver_earnings.dart';
// Hiding PaymentMethod and OrderItem from delivery_order to avoid conflicts
export 'package:eatfast_mobile/shared/models/delivery_order.dart' hide PaymentMethod, OrderItem;

// Utility types (hiding Failure from result.dart as failure.dart has the comprehensive version)
export 'package:eatfast_mobile/shared/utils/result.dart' hide Failure;
export 'package:eatfast_mobile/shared/utils/failure.dart';
