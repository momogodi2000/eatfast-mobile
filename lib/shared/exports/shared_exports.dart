/// Shared Exports - Centralized exports for commonly used classes
/// Import this file to get access to all shared functionality across the app
///
/// Usage:
/// ```dart
/// import 'package:eatfast_mobile/shared/exports/shared_exports.dart';
/// ```
library;

// Constants
export '../constants/api_constants.dart';
export '../constants/app_constants.dart';
export '../config/app_config.dart';

// Themes
export '../themes/app_theme.dart';
export '../themes/app_colors.dart';
export '../themes/app_text_styles.dart';
export '../themes/design_tokens.dart';
export '../themes/theme_provider.dart';

// Routing
export '../config/router/app_router.dart';
export '../config/router/route_names.dart';
export '../config/router/route_guard.dart';

// Models
export '../models/restaurant_models.dart';
export '../models/loyalty_models.dart';
export '../models/wallet_models.dart';
export '../models/menu_item.dart';
// Restaurant model is exported from services/restaurants/domain/models/restaurant.dart

// Utilities
export '../utils/result.dart';
// export '../utils/failure.dart';
export '../utils/error/app_error.dart';
export '../utils/error/error_handler.dart';
export '../utils/utils/validators.dart';
export '../utils/utils/responsive_utils.dart';

// Common Widgets
export '../widgets/common/app_loading_indicator.dart';
export '../widgets/common/loading_widget.dart';
export '../widgets/common/error_display_widget.dart';
export '../widgets/buttons/app_button.dart';
export '../widgets/cards/restaurant_card.dart';
export '../widgets/overlays/loading_overlay.dart';

// Services - API
export '../services/api/api_client.dart';

// Services - Auth
export '../services/auth/unified_auth_service.dart';
export '../services/auth/providers/unified_auth_provider.dart';

// Localization
export '../l10n/arb/app_localizations.dart';
export '../l10n/language_provider.dart';
