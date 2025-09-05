import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_order.freezed.dart';
part 'group_order.g.dart';

@freezed
class GroupOrder with _$GroupOrder {
  const factory GroupOrder({
    required String groupOrderId,
    required String organizerId,
    required String organizerName,
    required String restaurantId,
    required String restaurantName,
    required GroupOrderStatus status,
    required DateTime createdAt,
    required DateTime orderDeadline,
    required List<GroupOrderParticipant> participants,
    required List<GroupOrderItem> items,
    required GroupOrderPayment paymentInfo,
    String? groupName,
    String? description,
    String? inviteCode,
    String? deliveryAddress,
    double? deliveryFee,
    double? serviceFee,
    double? totalAmount,
    DateTime? estimatedDeliveryTime,
    String? specialInstructions,
    @Default([]) List<String> tags,
    @Default(false) bool isPrivate,
    @Default(10) int maxParticipants,
    Map<String, dynamic>? metadata,
  }) = _GroupOrder;

  factory GroupOrder.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderFromJson(json);
}

@freezed
class GroupOrderParticipant with _$GroupOrderParticipant {
  const factory GroupOrderParticipant({
    required String userId,
    required String userName,
    required String email,
    required DateTime joinedAt,
    required ParticipantRole role,
    required ParticipantStatus status,
    String? profilePicture,
    String? phoneNumber,
    double? contributionAmount,
    @Default([]) List<String> orderItemIds,
    @Default(false) bool hasOrdered,
    @Default(false) bool hasPaid,
    DateTime? lastActivity,
    Map<String, dynamic>? preferences,
  }) = _GroupOrderParticipant;

  factory GroupOrderParticipant.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderParticipantFromJson(json);
}

@freezed
class GroupOrderItem with _$GroupOrderItem {
  const factory GroupOrderItem({
    required String itemId,
    required String userId,
    required String userName,
    required String menuItemId,
    required String itemName,
    required double price,
    required int quantity,
    required DateTime addedAt,
    String? itemImage,
    String? itemDescription,
    @Default([]) List<String> customizations,
    String? specialInstructions,
    @Default(ItemStatus.pending) ItemStatus status,
    double? discountAmount,
    Map<String, dynamic>? itemDetails,
  }) = _GroupOrderItem;

  factory GroupOrderItem.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderItemFromJson(json);
}

@freezed
class GroupOrderPayment with _$GroupOrderPayment {
  const factory GroupOrderPayment({
    required PaymentSplitType splitType,
    required double totalAmount,
    required Map<String, double> participantAmounts,
    required PaymentMethod paymentMethod,
    @Default([]) List<PaymentTransaction> transactions,
    String? paymentInstructions,
    double? tipAmount,
    @Default(false) bool isPaymentCompleted,
    DateTime? paymentDeadline,
    String? paymentLinkId,
    Map<String, dynamic>? paymentDetails,
  }) = _GroupOrderPayment;

  factory GroupOrderPayment.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderPaymentFromJson(json);
}

@freezed
class PaymentTransaction with _$PaymentTransaction {
  const factory PaymentTransaction({
    required String transactionId,
    required String userId,
    required String userName,
    required double amount,
    required DateTime timestamp,
    required TransactionStatus status,
    String? paymentMethodId,
    String? transactionReference,
    String? failureReason,
    Map<String, dynamic>? transactionData,
  }) = _PaymentTransaction;

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      _$PaymentTransactionFromJson(json);
}

@freezed
class GroupOrderInvitation with _$GroupOrderInvitation {
  const factory GroupOrderInvitation({
    required String invitationId,
    required String groupOrderId,
    required String invitedBy,
    required String invitedByName,
    required String invitedEmail,
    required DateTime sentAt,
    required InvitationStatus status,
    String? invitedUserId,
    String? invitedUserName,
    String? personalMessage,
    DateTime? respondedAt,
    DateTime? expiresAt,
    String? inviteLink,
  }) = _GroupOrderInvitation;

  factory GroupOrderInvitation.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderInvitationFromJson(json);
}

@freezed
class GroupOrderChat with _$GroupOrderChat {
  const factory GroupOrderChat({
    required String messageId,
    required String groupOrderId,
    required String senderId,
    required String senderName,
    required String message,
    required DateTime timestamp,
    required MessageType type,
    String? senderAvatar,
    String? replyToMessageId,
    @Default([]) List<String> mentions,
    @Default(false) bool isSystemMessage,
    @Default([]) List<String> readBy,
    Map<String, dynamic>? attachments,
  }) = _GroupOrderChat;

  factory GroupOrderChat.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderChatFromJson(json);
}

@freezed
class GroupOrderTemplate with _$GroupOrderTemplate {
  const factory GroupOrderTemplate({
    required String templateId,
    required String createdBy,
    required String templateName,
    required String restaurantId,
    required String restaurantName,
    required List<String> defaultItems,
    required DateTime createdAt,
    String? description,
    String? imageUrl,
    int? maxParticipants,
    PaymentSplitType? defaultSplitType,
    @Default([]) List<String> tags,
    @Default(0) int useCount,
    @Default(true) bool isActive,
    Map<String, dynamic>? templateSettings,
  }) = _GroupOrderTemplate;

  factory GroupOrderTemplate.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderTemplateFromJson(json);
}

@freezed
class GroupOrderStats with _$GroupOrderStats {
  const factory GroupOrderStats({
    required String userId,
    required int totalGroupOrders,
    required int organizedOrders,
    required int participatedOrders,
    required double totalSpent,
    required double averageOrderValue,
    required String favoriteRestaurant,
    required List<String> frequentParticipants,
    DateTime? lastGroupOrder,
    Map<String, int>? restaurantOrderCounts,
    Map<String, double>? monthlySpending,
  }) = _GroupOrderStats;

  factory GroupOrderStats.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderStatsFromJson(json);
}

enum GroupOrderStatus {
  @JsonValue('creating')
  creating,
  @JsonValue('inviting')
  inviting,
  @JsonValue('ordering')
  ordering,
  @JsonValue('payment_pending')
  paymentPending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('preparing')
  preparing,
  @JsonValue('ready')
  ready,
  @JsonValue('delivering')
  delivering,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('expired')
  expired,
}

enum ParticipantRole {
  @JsonValue('organizer')
  organizer,
  @JsonValue('participant')
  participant,
  @JsonValue('viewer')
  viewer,
}

enum ParticipantStatus {
  @JsonValue('invited')
  invited,
  @JsonValue('joined')
  joined,
  @JsonValue('ordered')
  ordered,
  @JsonValue('paid')
  paid,
  @JsonValue('declined')
  declined,
  @JsonValue('removed')
  removed,
}

enum ItemStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('modified')
  modified,
  @JsonValue('removed')
  removed,
}

enum PaymentSplitType {
  @JsonValue('equal')
  equal,
  @JsonValue('by_items')
  byItems,
  @JsonValue('custom')
  custom,
  @JsonValue('organizer_pays')
  organizerPays,
}

enum PaymentMethod {
  @JsonValue('mobile_money')
  mobileMoney,
  @JsonValue('card')
  card,
  @JsonValue('cash')
  cash,
  @JsonValue('split_payment')
  splitPayment,
}

enum TransactionStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('processing')
  processing,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('refunded')
  refunded,
}

enum InvitationStatus {
  @JsonValue('sent')
  sent,
  @JsonValue('delivered')
  delivered,
  @JsonValue('viewed')
  viewed,
  @JsonValue('accepted')
  accepted,
  @JsonValue('declined')
  declined,
  @JsonValue('expired')
  expired,
}

enum MessageType {
  @JsonValue('text')
  text,
  @JsonValue('system')
  system,
  @JsonValue('order_update')
  orderUpdate,
  @JsonValue('payment_reminder')
  paymentReminder,
  @JsonValue('item_added')
  itemAdded,
  @JsonValue('item_removed')
  itemRemoved,
}

extension GroupOrderStatusExtension on GroupOrderStatus {
  String get displayName {
    switch (this) {
      case GroupOrderStatus.creating:
        return 'Création en cours';
      case GroupOrderStatus.inviting:
        return 'Envoi d\'invitations';
      case GroupOrderStatus.ordering:
        return 'Commandes en cours';
      case GroupOrderStatus.paymentPending:
        return 'Paiement en attente';
      case GroupOrderStatus.confirmed:
        return 'Confirmée';
      case GroupOrderStatus.preparing:
        return 'En préparation';
      case GroupOrderStatus.ready:
        return 'Prête';
      case GroupOrderStatus.delivering:
        return 'En livraison';
      case GroupOrderStatus.delivered:
        return 'Livrée';
      case GroupOrderStatus.cancelled:
        return 'Annulée';
      case GroupOrderStatus.expired:
        return 'Expirée';
    }
  }

  String get color {
    switch (this) {
      case GroupOrderStatus.creating:
      case GroupOrderStatus.inviting:
      case GroupOrderStatus.ordering:
        return 'blue';
      case GroupOrderStatus.paymentPending:
        return 'orange';
      case GroupOrderStatus.confirmed:
      case GroupOrderStatus.preparing:
      case GroupOrderStatus.ready:
        return 'yellow';
      case GroupOrderStatus.delivering:
        return 'purple';
      case GroupOrderStatus.delivered:
        return 'green';
      case GroupOrderStatus.cancelled:
      case GroupOrderStatus.expired:
        return 'red';
    }
  }

  String get icon {
    switch (this) {
      case GroupOrderStatus.creating:
        return '📝';
      case GroupOrderStatus.inviting:
        return '📧';
      case GroupOrderStatus.ordering:
        return '🛒';
      case GroupOrderStatus.paymentPending:
        return '💳';
      case GroupOrderStatus.confirmed:
        return '✅';
      case GroupOrderStatus.preparing:
        return '👨‍🍳';
      case GroupOrderStatus.ready:
        return '🍽️';
      case GroupOrderStatus.delivering:
        return '🚴';
      case GroupOrderStatus.delivered:
        return '✨';
      case GroupOrderStatus.cancelled:
        return '❌';
      case GroupOrderStatus.expired:
        return '⏰';
    }
  }
}

extension ParticipantRoleExtension on ParticipantRole {
  String get displayName {
    switch (this) {
      case ParticipantRole.organizer:
        return 'Organisateur';
      case ParticipantRole.participant:
        return 'Participant';
      case ParticipantRole.viewer:
        return 'Observateur';
    }
  }
}

extension ParticipantStatusExtension on ParticipantStatus {
  String get displayName {
    switch (this) {
      case ParticipantStatus.invited:
        return 'Invité';
      case ParticipantStatus.joined:
        return 'Rejoint';
      case ParticipantStatus.ordered:
        return 'Commandé';
      case ParticipantStatus.paid:
        return 'Payé';
      case ParticipantStatus.declined:
        return 'Refusé';
      case ParticipantStatus.removed:
        return 'Retiré';
    }
  }

  String get color {
    switch (this) {
      case ParticipantStatus.invited:
        return 'orange';
      case ParticipantStatus.joined:
        return 'blue';
      case ParticipantStatus.ordered:
        return 'purple';
      case ParticipantStatus.paid:
        return 'green';
      case ParticipantStatus.declined:
      case ParticipantStatus.removed:
        return 'red';
    }
  }
}

extension PaymentSplitTypeExtension on PaymentSplitType {
  String get displayName {
    switch (this) {
      case PaymentSplitType.equal:
        return 'Partage égal';
      case PaymentSplitType.byItems:
        return 'Selon les articles';
      case PaymentSplitType.custom:
        return 'Personnalisé';
      case PaymentSplitType.organizerPays:
        return 'Organisateur paie';
    }
  }

  String get description {
    switch (this) {
      case PaymentSplitType.equal:
        return 'Le montant total est divisé équitablement entre tous les participants';
      case PaymentSplitType.byItems:
        return 'Chaque participant paie pour ses propres articles';
      case PaymentSplitType.custom:
        return 'Montants personnalisés pour chaque participant';
      case PaymentSplitType.organizerPays:
        return 'L\'organisateur paie la totalité de la commande';
    }
  }
}