/// Domain models for client module
///
/// This file exports all domain models used in the client module.
/// Following the deduplication strategy, most models are now in shared locations.
library;

// Export profile repository models (excluding PaymentMethod to avoid conflict with shared)
export 'profile_repository.dart' show Address, NotificationPreferences;

// Re-export commonly used shared models for convenience
export 'package:eatfast_mobile/shared/services/orders/domain/models/order.dart';
export 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';
export 'package:eatfast_mobile/shared/models/exports.dart';
