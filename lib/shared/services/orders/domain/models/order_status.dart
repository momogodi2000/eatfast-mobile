/// Order status enum matching backend
enum OrderStatus {
  created('created'),
  pending('pending'),
  accepted('accepted'),
  confirmed('confirmed'),
  preparing('preparing'),
  ready('ready'),
  readyForPickup('ready_for_pickup'),
  assignedDriver('assigned_driver'),
  pickedUp('picked_up'),
  onTheWay('on_the_way'),
  inTransit('in_transit'),
  delivered('delivered'),
  completed('completed'),
  cancelled('cancelled'),
  rejected('rejected'),
  refunded('refunded'),
  expired('expired');

  const OrderStatus(this.value);
  final String value;

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (status) => status.value == value.toLowerCase(),
      orElse: () => OrderStatus.pending,
    );
  }

  String get displayName {
    switch (this) {
      case OrderStatus.created:
        return 'Créée';
      case OrderStatus.pending:
        return 'En attente';
      case OrderStatus.accepted:
        return 'Acceptée';
      case OrderStatus.confirmed:
        return 'Confirmée';
      case OrderStatus.preparing:
        return 'En préparation';
      case OrderStatus.ready:
        return 'Prête';
      case OrderStatus.readyForPickup:
        return 'Prête pour récupération';
      case OrderStatus.assignedDriver:
        return 'Livreur assigné';
      case OrderStatus.pickedUp:
        return 'Récupérée';
      case OrderStatus.onTheWay:
        return 'En cours de livraison';
      case OrderStatus.inTransit:
        return 'En transit';
      case OrderStatus.delivered:
        return 'Livrée';
      case OrderStatus.completed:
        return 'Terminée';
      case OrderStatus.cancelled:
        return 'Annulée';
      case OrderStatus.rejected:
        return 'Rejetée';
      case OrderStatus.refunded:
        return 'Remboursée';
      case OrderStatus.expired:
        return 'Expirée';
    }
  }

  bool get isActive => [
    OrderStatus.created,
    OrderStatus.pending,
    OrderStatus.accepted,
    OrderStatus.confirmed,
    OrderStatus.preparing,
    OrderStatus.ready,
    OrderStatus.readyForPickup,
    OrderStatus.assignedDriver,
    OrderStatus.pickedUp,
    OrderStatus.onTheWay,
    OrderStatus.inTransit,
  ].contains(this);

  bool get isCompleted =>
      this == OrderStatus.delivered || this == OrderStatus.completed;
  bool get isCancelled => this == OrderStatus.cancelled;
  bool get canBeCancelled => [
    OrderStatus.pending,
    OrderStatus.accepted,
    OrderStatus.confirmed,
  ].contains(this);
}
