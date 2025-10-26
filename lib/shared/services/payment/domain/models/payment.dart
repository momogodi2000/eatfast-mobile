/// Payment method enum for domain layer
enum PaymentMethod { cash, campay, noupay, stripe, wallet, mtn, orange }

/// Extension for PaymentMethod to add display properties
extension PaymentMethodExtension on PaymentMethod {
  /// Display name for the payment method
  String get displayName {
    switch (this) {
      case PaymentMethod.cash:
        return 'Espèces';
      case PaymentMethod.campay:
        return 'CamPay';
      case PaymentMethod.noupay:
        return 'NouPay';
      case PaymentMethod.stripe:
        return 'Carte bancaire';
      case PaymentMethod.wallet:
        return 'Portefeuille';
      case PaymentMethod.mtn:
        return 'MTN Mobile Money';
      case PaymentMethod.orange:
        return 'Orange Money';
    }
  }

  /// Icon asset path for the payment method
  String get icon {
    switch (this) {
      case PaymentMethod.cash:
        return 'assets/icons/cash.png';
      case PaymentMethod.campay:
        return 'assets/icons/campay.png';
      case PaymentMethod.noupay:
        return 'assets/icons/noupay.png';
      case PaymentMethod.stripe:
        return 'assets/icons/stripe.png';
      case PaymentMethod.wallet:
        return 'assets/icons/wallet.png';
      case PaymentMethod.mtn:
        return 'assets/icons/mtn.png';
      case PaymentMethod.orange:
        return 'assets/icons/orange.png';
    }
  }

  /// Whether this payment method requires a phone number
  bool get requiresPhoneNumber {
    switch (this) {
      case PaymentMethod.campay:
      case PaymentMethod.noupay:
      case PaymentMethod.mtn:
      case PaymentMethod.orange:
        return true;
      case PaymentMethod.cash:
      case PaymentMethod.stripe:
      case PaymentMethod.wallet:
        return false;
    }
  }
}
