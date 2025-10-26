/// Central Payment Module Exports
/// Import this file to get access to all payment-related functionality
///
/// Usage:
/// ```dart
/// import 'package:eatfast_mobile/shared/services/payment/payment_exports.dart';
/// ```
library;

// Data Layer - Payment Services
export 'data/campay_service.dart';
export 'data/noupay_service.dart';
export 'data/stripe_service.dart';
// Note: unified_payment_service.dart has duplicate enums (PaymentMethod, PaymentStatus)
// Import it directly if needed: import 'package:eatfast_mobile/shared/services/payment/data/unified_payment_service.dart';

// Domain Layer - Canonical Payment Models (single source of truth)
// Export primary payment models from domain layer only
export 'domain/models/payment.dart'; // PaymentMethod, PaymentStatus enums
// Note: payment_models.dart also has PaymentStatus - creates ambiguity
// Use domain/models/payment.dart as canonical source
export 'domain/models/payment_exceptions.dart';
export 'domain/models/mobile_money_response.dart';
export 'domain/payment_manager.dart';

// Presentation Layer - UI Components
export 'presentation/widgets/enhanced_payment_selector.dart';
export 'presentation/widgets/stripe_payment_widget.dart';
export 'presentation/widgets/card_payment_stub.dart';
