// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupOrderImpl _$$GroupOrderImplFromJson(Map<String, dynamic> json) =>
    _$GroupOrderImpl(
      groupOrderId: json['groupOrderId'] as String,
      organizerId: json['organizerId'] as String,
      organizerName: json['organizerName'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      status: $enumDecode(_$GroupOrderStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      orderDeadline: DateTime.parse(json['orderDeadline'] as String),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => GroupOrderParticipant.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => GroupOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentInfo: GroupOrderPayment.fromJson(
          json['paymentInfo'] as Map<String, dynamic>),
      groupName: json['groupName'] as String?,
      description: json['description'] as String?,
      inviteCode: json['inviteCode'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      serviceFee: (json['serviceFee'] as num?)?.toDouble(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] == null
          ? null
          : DateTime.parse(json['estimatedDeliveryTime'] as String),
      specialInstructions: json['specialInstructions'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      isPrivate: json['isPrivate'] as bool? ?? false,
      maxParticipants: (json['maxParticipants'] as num?)?.toInt() ?? 10,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GroupOrderImplToJson(_$GroupOrderImpl instance) =>
    <String, dynamic>{
      'groupOrderId': instance.groupOrderId,
      'organizerId': instance.organizerId,
      'organizerName': instance.organizerName,
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'status': _$GroupOrderStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'orderDeadline': instance.orderDeadline.toIso8601String(),
      'participants': instance.participants,
      'items': instance.items,
      'paymentInfo': instance.paymentInfo,
      'groupName': instance.groupName,
      'description': instance.description,
      'inviteCode': instance.inviteCode,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryFee': instance.deliveryFee,
      'serviceFee': instance.serviceFee,
      'totalAmount': instance.totalAmount,
      'estimatedDeliveryTime':
          instance.estimatedDeliveryTime?.toIso8601String(),
      'specialInstructions': instance.specialInstructions,
      'tags': instance.tags,
      'isPrivate': instance.isPrivate,
      'maxParticipants': instance.maxParticipants,
      'metadata': instance.metadata,
    };

const _$GroupOrderStatusEnumMap = {
  GroupOrderStatus.creating: 'creating',
  GroupOrderStatus.inviting: 'inviting',
  GroupOrderStatus.ordering: 'ordering',
  GroupOrderStatus.paymentPending: 'payment_pending',
  GroupOrderStatus.confirmed: 'confirmed',
  GroupOrderStatus.preparing: 'preparing',
  GroupOrderStatus.ready: 'ready',
  GroupOrderStatus.delivering: 'delivering',
  GroupOrderStatus.delivered: 'delivered',
  GroupOrderStatus.cancelled: 'cancelled',
  GroupOrderStatus.expired: 'expired',
};

_$GroupOrderParticipantImpl _$$GroupOrderParticipantImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupOrderParticipantImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      role: $enumDecode(_$ParticipantRoleEnumMap, json['role']),
      status: $enumDecode(_$ParticipantStatusEnumMap, json['status']),
      profilePicture: json['profilePicture'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      contributionAmount: (json['contributionAmount'] as num?)?.toDouble(),
      orderItemIds: (json['orderItemIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      hasOrdered: json['hasOrdered'] as bool? ?? false,
      hasPaid: json['hasPaid'] as bool? ?? false,
      lastActivity: json['lastActivity'] == null
          ? null
          : DateTime.parse(json['lastActivity'] as String),
      preferences: json['preferences'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GroupOrderParticipantImplToJson(
        _$GroupOrderParticipantImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'role': _$ParticipantRoleEnumMap[instance.role]!,
      'status': _$ParticipantStatusEnumMap[instance.status]!,
      'profilePicture': instance.profilePicture,
      'phoneNumber': instance.phoneNumber,
      'contributionAmount': instance.contributionAmount,
      'orderItemIds': instance.orderItemIds,
      'hasOrdered': instance.hasOrdered,
      'hasPaid': instance.hasPaid,
      'lastActivity': instance.lastActivity?.toIso8601String(),
      'preferences': instance.preferences,
    };

const _$ParticipantRoleEnumMap = {
  ParticipantRole.organizer: 'organizer',
  ParticipantRole.participant: 'participant',
  ParticipantRole.viewer: 'viewer',
};

const _$ParticipantStatusEnumMap = {
  ParticipantStatus.invited: 'invited',
  ParticipantStatus.joined: 'joined',
  ParticipantStatus.ordered: 'ordered',
  ParticipantStatus.paid: 'paid',
  ParticipantStatus.declined: 'declined',
  ParticipantStatus.removed: 'removed',
};

_$GroupOrderItemImpl _$$GroupOrderItemImplFromJson(Map<String, dynamic> json) =>
    _$GroupOrderItemImpl(
      itemId: json['itemId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      menuItemId: json['menuItemId'] as String,
      itemName: json['itemName'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      addedAt: DateTime.parse(json['addedAt'] as String),
      itemImage: json['itemImage'] as String?,
      itemDescription: json['itemDescription'] as String?,
      customizations: (json['customizations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      specialInstructions: json['specialInstructions'] as String?,
      status: $enumDecodeNullable(_$ItemStatusEnumMap, json['status']) ??
          ItemStatus.pending,
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      itemDetails: json['itemDetails'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GroupOrderItemImplToJson(
        _$GroupOrderItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'userId': instance.userId,
      'userName': instance.userName,
      'menuItemId': instance.menuItemId,
      'itemName': instance.itemName,
      'price': instance.price,
      'quantity': instance.quantity,
      'addedAt': instance.addedAt.toIso8601String(),
      'itemImage': instance.itemImage,
      'itemDescription': instance.itemDescription,
      'customizations': instance.customizations,
      'specialInstructions': instance.specialInstructions,
      'status': _$ItemStatusEnumMap[instance.status]!,
      'discountAmount': instance.discountAmount,
      'itemDetails': instance.itemDetails,
    };

const _$ItemStatusEnumMap = {
  ItemStatus.pending: 'pending',
  ItemStatus.confirmed: 'confirmed',
  ItemStatus.modified: 'modified',
  ItemStatus.removed: 'removed',
};

_$GroupOrderPaymentImpl _$$GroupOrderPaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupOrderPaymentImpl(
      splitType: $enumDecode(_$PaymentSplitTypeEnumMap, json['splitType']),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      participantAmounts:
          (json['participantAmounts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map(
                  (e) => PaymentTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      paymentInstructions: json['paymentInstructions'] as String?,
      tipAmount: (json['tipAmount'] as num?)?.toDouble(),
      isPaymentCompleted: json['isPaymentCompleted'] as bool? ?? false,
      paymentDeadline: json['paymentDeadline'] == null
          ? null
          : DateTime.parse(json['paymentDeadline'] as String),
      paymentLinkId: json['paymentLinkId'] as String?,
      paymentDetails: json['paymentDetails'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GroupOrderPaymentImplToJson(
        _$GroupOrderPaymentImpl instance) =>
    <String, dynamic>{
      'splitType': _$PaymentSplitTypeEnumMap[instance.splitType]!,
      'totalAmount': instance.totalAmount,
      'participantAmounts': instance.participantAmounts,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'transactions': instance.transactions,
      'paymentInstructions': instance.paymentInstructions,
      'tipAmount': instance.tipAmount,
      'isPaymentCompleted': instance.isPaymentCompleted,
      'paymentDeadline': instance.paymentDeadline?.toIso8601String(),
      'paymentLinkId': instance.paymentLinkId,
      'paymentDetails': instance.paymentDetails,
    };

const _$PaymentSplitTypeEnumMap = {
  PaymentSplitType.equal: 'equal',
  PaymentSplitType.byItems: 'by_items',
  PaymentSplitType.custom: 'custom',
  PaymentSplitType.organizerPays: 'organizer_pays',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.mobileMoney: 'mobile_money',
  PaymentMethod.card: 'card',
  PaymentMethod.cash: 'cash',
  PaymentMethod.splitPayment: 'split_payment',
};

_$PaymentTransactionImpl _$$PaymentTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentTransactionImpl(
      transactionId: json['transactionId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      amount: (json['amount'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
      paymentMethodId: json['paymentMethodId'] as String?,
      transactionReference: json['transactionReference'] as String?,
      failureReason: json['failureReason'] as String?,
      transactionData: json['transactionData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentTransactionImplToJson(
        _$PaymentTransactionImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'userId': instance.userId,
      'userName': instance.userName,
      'amount': instance.amount,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'paymentMethodId': instance.paymentMethodId,
      'transactionReference': instance.transactionReference,
      'failureReason': instance.failureReason,
      'transactionData': instance.transactionData,
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.processing: 'processing',
  TransactionStatus.completed: 'completed',
  TransactionStatus.failed: 'failed',
  TransactionStatus.cancelled: 'cancelled',
  TransactionStatus.refunded: 'refunded',
};

_$GroupOrderInvitationImpl _$$GroupOrderInvitationImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupOrderInvitationImpl(
      invitationId: json['invitationId'] as String,
      groupOrderId: json['groupOrderId'] as String,
      invitedBy: json['invitedBy'] as String,
      invitedByName: json['invitedByName'] as String,
      invitedEmail: json['invitedEmail'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
      status: $enumDecode(_$InvitationStatusEnumMap, json['status']),
      invitedUserId: json['invitedUserId'] as String?,
      invitedUserName: json['invitedUserName'] as String?,
      personalMessage: json['personalMessage'] as String?,
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      inviteLink: json['inviteLink'] as String?,
    );

Map<String, dynamic> _$$GroupOrderInvitationImplToJson(
        _$GroupOrderInvitationImpl instance) =>
    <String, dynamic>{
      'invitationId': instance.invitationId,
      'groupOrderId': instance.groupOrderId,
      'invitedBy': instance.invitedBy,
      'invitedByName': instance.invitedByName,
      'invitedEmail': instance.invitedEmail,
      'sentAt': instance.sentAt.toIso8601String(),
      'status': _$InvitationStatusEnumMap[instance.status]!,
      'invitedUserId': instance.invitedUserId,
      'invitedUserName': instance.invitedUserName,
      'personalMessage': instance.personalMessage,
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'inviteLink': instance.inviteLink,
    };

const _$InvitationStatusEnumMap = {
  InvitationStatus.sent: 'sent',
  InvitationStatus.delivered: 'delivered',
  InvitationStatus.viewed: 'viewed',
  InvitationStatus.accepted: 'accepted',
  InvitationStatus.declined: 'declined',
  InvitationStatus.expired: 'expired',
};

_$GroupOrderChatImpl _$$GroupOrderChatImplFromJson(Map<String, dynamic> json) =>
    _$GroupOrderChatImpl(
      messageId: json['messageId'] as String,
      groupOrderId: json['groupOrderId'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      senderAvatar: json['senderAvatar'] as String?,
      replyToMessageId: json['replyToMessageId'] as String?,
      mentions: (json['mentions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isSystemMessage: json['isSystemMessage'] as bool? ?? false,
      readBy: (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      attachments: json['attachments'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GroupOrderChatImplToJson(
        _$GroupOrderChatImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'groupOrderId': instance.groupOrderId,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': _$MessageTypeEnumMap[instance.type]!,
      'senderAvatar': instance.senderAvatar,
      'replyToMessageId': instance.replyToMessageId,
      'mentions': instance.mentions,
      'isSystemMessage': instance.isSystemMessage,
      'readBy': instance.readBy,
      'attachments': instance.attachments,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.system: 'system',
  MessageType.orderUpdate: 'order_update',
  MessageType.paymentReminder: 'payment_reminder',
  MessageType.itemAdded: 'item_added',
  MessageType.itemRemoved: 'item_removed',
};

_$GroupOrderTemplateImpl _$$GroupOrderTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupOrderTemplateImpl(
      templateId: json['templateId'] as String,
      createdBy: json['createdBy'] as String,
      templateName: json['templateName'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      defaultItems: (json['defaultItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      maxParticipants: (json['maxParticipants'] as num?)?.toInt(),
      defaultSplitType: $enumDecodeNullable(
          _$PaymentSplitTypeEnumMap, json['defaultSplitType']),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      useCount: (json['useCount'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      templateSettings: json['templateSettings'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GroupOrderTemplateImplToJson(
        _$GroupOrderTemplateImpl instance) =>
    <String, dynamic>{
      'templateId': instance.templateId,
      'createdBy': instance.createdBy,
      'templateName': instance.templateName,
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'defaultItems': instance.defaultItems,
      'createdAt': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'maxParticipants': instance.maxParticipants,
      'defaultSplitType': _$PaymentSplitTypeEnumMap[instance.defaultSplitType],
      'tags': instance.tags,
      'useCount': instance.useCount,
      'isActive': instance.isActive,
      'templateSettings': instance.templateSettings,
    };

_$GroupOrderStatsImpl _$$GroupOrderStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupOrderStatsImpl(
      userId: json['userId'] as String,
      totalGroupOrders: (json['totalGroupOrders'] as num).toInt(),
      organizedOrders: (json['organizedOrders'] as num).toInt(),
      participatedOrders: (json['participatedOrders'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      favoriteRestaurant: json['favoriteRestaurant'] as String,
      frequentParticipants: (json['frequentParticipants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastGroupOrder: json['lastGroupOrder'] == null
          ? null
          : DateTime.parse(json['lastGroupOrder'] as String),
      restaurantOrderCounts:
          (json['restaurantOrderCounts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      monthlySpending: (json['monthlySpending'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$GroupOrderStatsImplToJson(
        _$GroupOrderStatsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalGroupOrders': instance.totalGroupOrders,
      'organizedOrders': instance.organizedOrders,
      'participatedOrders': instance.participatedOrders,
      'totalSpent': instance.totalSpent,
      'averageOrderValue': instance.averageOrderValue,
      'favoriteRestaurant': instance.favoriteRestaurant,
      'frequentParticipants': instance.frequentParticipants,
      'lastGroupOrder': instance.lastGroupOrder?.toIso8601String(),
      'restaurantOrderCounts': instance.restaurantOrderCounts,
      'monthlySpending': instance.monthlySpending,
    };
