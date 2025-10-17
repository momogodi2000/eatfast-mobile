/// Core exports - Centralized imports for common classes
/// This file should be used throughout the app for consistent imports
library;

// API & Networking
export 'package:eatfast_mobile/shared/services/api/api_client.dart';
export 'package:eatfast_mobile/shared/constants/api_constants.dart';

// Models
export 'package:eatfast_mobile/shared/models/loyalty_models.dart';
export 'package:eatfast_mobile/shared/models/wallet_models.dart' hide PaymentMethod, TopUpState;
export 'package:eatfast_mobile/shared/models/restaurant_models.dart';
export 'package:eatfast_mobile/shared/models/menu_item.dart';
export 'package:eatfast_mobile/shared/models/admin_stats.dart';

// Auth
export 'package:eatfast_mobile/shared/services/auth/models/app_user.dart' hide AuthStatus;
export 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';

// Cart
export 'package:eatfast_mobile/shared/services/cart/domain/models/cart.dart';
export 'package:eatfast_mobile/shared/services/cart/domain/models/cart_item.dart';

// Orders
export 'package:eatfast_mobile/shared/services/orders/domain/models/order.dart';

// Payment
export 'package:eatfast_mobile/shared/services/payment/domain/payment_manager.dart';
export 'package:eatfast_mobile/shared/services/payment/domain/models/payment_method.dart';

// Providers
export 'package:eatfast_mobile/shared/services/loyalty/providers/loyalty_provider.dart';
export 'package:eatfast_mobile/shared/services/cart/providers/cart_provider.dart';
export 'package:eatfast_mobile/shared/services/orders/providers/order_provider.dart';
export 'package:eatfast_mobile/shared/services/ratings/providers/rating_provider.dart';
export 'package:eatfast_mobile/shared/services/wallet/providers/wallet_provider.dart' show walletProvider, WalletNotifier;

// Themes
export 'package:eatfast_mobile/shared/themes/app_colors.dart';
export 'package:eatfast_mobile/shared/themes/app_text_styles.dart';
export 'package:eatfast_mobile/shared/themes/app_theme.dart';

// Widgets
export 'package:eatfast_mobile/shared/widgets/buttons/app_button.dart';

// Utils
export 'package:eatfast_mobile/shared/utils/error/error_handler.dart';
export 'package:eatfast_mobile/shared/utils/result.dart';
