import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class WhatsAppMessage {
  final String phoneNumber;
  final String message;
  final WhatsAppTemplate template;
  final String whatsappUrl;
  final Map<String, dynamic>? metadata;
  final DateTime? createdAt;

  const WhatsAppMessage({
    required this.phoneNumber,
    required this.message,
    required this.template,
    required this.whatsappUrl,
    this.metadata,
    this.createdAt,
  });

  factory WhatsAppMessage.fromJson(Map<String, dynamic> json) {
    return WhatsAppMessage(
      phoneNumber: json['phoneNumber'] as String,
      message: json['message'] as String,
      template: WhatsAppTemplate.values.firstWhere((e) => e.name == json['template']),
      whatsappUrl: json['whatsappUrl'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'message': message,
      'template': template.name,
      'whatsappUrl': whatsappUrl,
      if (metadata != null) 'metadata': metadata,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    };
  }

  WhatsAppMessage copyWith({
    String? phoneNumber,
    String? message,
    WhatsAppTemplate? template,
    String? whatsappUrl,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) {
    return WhatsAppMessage(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      message: message ?? this.message,
      template: template ?? this.template,
      whatsappUrl: whatsappUrl ?? this.whatsappUrl,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class WhatsAppContact {
  final String id;
  final String name;
  final String phoneNumber;
  final WhatsAppContactType type;
  final String? avatarUrl;
  final bool? isOnline;
  final DateTime? lastSeen;
  final Map<String, dynamic>? metadata;

  const WhatsAppContact({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.type,
    this.avatarUrl,
    this.isOnline,
    this.lastSeen,
    this.metadata,
  });

  factory WhatsAppContact.fromJson(Map<String, dynamic> json) {
    return WhatsAppContact(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      type: WhatsAppContactType.values.firstWhere((e) => e.name == json['type']),
      avatarUrl: json['avatarUrl'] as String?,
      isOnline: json['isOnline'] as bool?,
      lastSeen: json['lastSeen'] != null
          ? DateTime.parse(json['lastSeen'] as String)
          : null,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  WhatsAppContact copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    WhatsAppContactType? type,
    String? avatarUrl,
    bool? isOnline,
    DateTime? lastSeen,
    Map<String, dynamic>? metadata,
  }) {
    return WhatsAppContact(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      type: type ?? this.type,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
      metadata: metadata ?? this.metadata,
    );
  }
}

class WhatsAppConversation {
  final String id;
  final WhatsAppContact contact;
  final List<WhatsAppMessage> messages;
  final WhatsAppConversationStatus status;
  final String? lastMessage;
  final DateTime? lastMessageAt;
  final int? unreadCount;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  const WhatsAppConversation({
    required this.id,
    required this.contact,
    required this.messages,
    required this.status,
    this.lastMessage,
    this.lastMessageAt,
    this.unreadCount,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WhatsAppConversation.fromJson(Map<String, dynamic> json) {
    return WhatsAppConversation(
      id: json['id'] as String,
      contact: WhatsAppContact.fromJson(json['contact'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => WhatsAppMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: WhatsAppConversationStatus.values.firstWhere((e) => e.name == json['status']),
      lastMessage: json['lastMessage'] as String?,
      lastMessageAt: json['lastMessageAt'] != null
          ? DateTime.parse(json['lastMessageAt'] as String)
          : null,
      unreadCount: json['unreadCount'] as int?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  WhatsAppConversation copyWith({
    String? id,
    WhatsAppContact? contact,
    List<WhatsAppMessage>? messages,
    WhatsAppConversationStatus? status,
    String? lastMessage,
    DateTime? lastMessageAt,
    int? unreadCount,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WhatsAppConversation(
      id: id ?? this.id,
      contact: contact ?? this.contact,
      messages: messages ?? this.messages,
      status: status ?? this.status,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      unreadCount: unreadCount ?? this.unreadCount,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

enum WhatsAppTemplate {
  @JsonValue('support_general')
  supportGeneral,
  @JsonValue('delivery_inquiry')
  deliveryInquiry,
  @JsonValue('order_modification')
  orderModification,
  @JsonValue('cancellation_request')
  cancellationRequest,
  @JsonValue('issue_report')
  issueReport,
  @JsonValue('restaurant_contact')
  restaurantContact,
  @JsonValue('driver_contact')
  driverContact,
  @JsonValue('payment_issue')
  paymentIssue,
  @JsonValue('custom')
  custom,
}

enum WhatsAppContactType {
  @JsonValue('support')
  support,
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('driver')
  driver,
  @JsonValue('customer')
  customer,
  @JsonValue('admin')
  admin,
}

enum WhatsAppConversationStatus {
  @JsonValue('active')
  active,
  @JsonValue('pending')
  pending,
  @JsonValue('resolved')
  resolved,
  @JsonValue('closed')
  closed,
}

enum WhatsAppContext {
  @JsonValue('order_tracking')
  orderTracking,
  @JsonValue('customer_support')
  customerSupport,
  @JsonValue('restaurant_inquiry')
  restaurantInquiry,
  @JsonValue('payment_issue')
  paymentIssue,
  @JsonValue('general_inquiry')
  generalInquiry,
}

extension WhatsAppTemplateExtension on WhatsAppTemplate {
  String get displayName {
    switch (this) {
      case WhatsAppTemplate.supportGeneral:
        return 'Support général';
      case WhatsAppTemplate.deliveryInquiry:
        return 'Information de livraison';
      case WhatsAppTemplate.orderModification:
        return 'Modification de commande';
      case WhatsAppTemplate.cancellationRequest:
        return 'Demande d\'annulation';
      case WhatsAppTemplate.issueReport:
        return 'Signaler un problème';
      case WhatsAppTemplate.restaurantContact:
        return 'Contact restaurant';
      case WhatsAppTemplate.driverContact:
        return 'Contact livreur';
      case WhatsAppTemplate.paymentIssue:
        return 'Problème de paiement';
      case WhatsAppTemplate.custom:
        return 'Message personnalisé';
    }
  }

  String getTemplate({
    String? orderId,
    String? restaurantName,
    String? driverName,
    Map<String, dynamic>? customData,
  }) {
    switch (this) {
      case WhatsAppTemplate.supportGeneral:
        return 'Bonjour ! J\'ai besoin d\'aide avec EatFast. Pouvez-vous m\'assister ?';

      case WhatsAppTemplate.deliveryInquiry:
        return orderId != null
            ? 'Bonjour ! Je souhaite avoir des informations sur ma commande #$orderId. Quel est le délai de livraison estimé ?'
            : 'Bonjour ! Je souhaite avoir des informations sur ma commande. Quel est le délai de livraison estimé ?';

      case WhatsAppTemplate.orderModification:
        return orderId != null
            ? 'Bonjour ! Je souhaite modifier ma commande #$orderId. Est-ce encore possible ?'
            : 'Bonjour ! Je souhaite modifier ma commande. Est-ce encore possible ?';

      case WhatsAppTemplate.cancellationRequest:
        return orderId != null
            ? 'Bonjour ! Je souhaite annuler ma commande #$orderId. Pouvez-vous m\'aider ?'
            : 'Bonjour ! Je souhaite annuler ma commande. Pouvez-vous m\'aider ?';

      case WhatsAppTemplate.issueReport:
        return orderId != null
            ? 'Bonjour ! J\'ai un problème avec ma commande #$orderId. Pouvez-vous m\'aider à le résoudre ?'
            : 'Bonjour ! J\'ai un problème avec ma commande. Pouvez-vous m\'aider à le résoudre ?';

      case WhatsAppTemplate.restaurantContact:
        return restaurantName != null
            ? 'Bonjour $restaurantName ! J\'ai une question concernant ma commande${orderId != null ? ' #$orderId' : ''}.'
            : 'Bonjour ! J\'ai une question concernant ma commande${orderId != null ? ' #$orderId' : ''}.';

      case WhatsAppTemplate.driverContact:
        return 'Bonjour ! Je suis le client de la commande${orderId != null ? ' #$orderId' : ''}. Pouvez-vous me donner une mise à jour sur la livraison ?';

      case WhatsAppTemplate.paymentIssue:
        return orderId != null
            ? 'Bonjour ! J\'ai un problème de paiement avec ma commande #$orderId. Pouvez-vous m\'aider ?'
            : 'Bonjour ! J\'ai un problème de paiement. Pouvez-vous m\'aider ?';

      case WhatsAppTemplate.custom:
        return customData?['message'] ?? 'Bonjour ! J\'ai besoin d\'aide.';
    }
  }
}

extension WhatsAppContactTypeExtension on WhatsAppContactType {
  String get displayName {
    switch (this) {
      case WhatsAppContactType.support:
        return 'Support';
      case WhatsAppContactType.restaurant:
        return 'Restaurant';
      case WhatsAppContactType.driver:
        return 'Livreur';
      case WhatsAppContactType.customer:
        return 'Client';
      case WhatsAppContactType.admin:
        return 'Administrateur';
    }
  }

  IconData get icon {
    switch (this) {
      case WhatsAppContactType.support:
        return Icons.support_agent;
      case WhatsAppContactType.restaurant:
        return Icons.restaurant;
      case WhatsAppContactType.driver:
        return Icons.delivery_dining;
      case WhatsAppContactType.customer:
        return Icons.person;
      case WhatsAppContactType.admin:
        return Icons.admin_panel_settings;
    }
  }
}

extension WhatsAppConversationStatusExtension on WhatsAppConversationStatus {
  String get displayName {
    switch (this) {
      case WhatsAppConversationStatus.active:
        return 'Active';
      case WhatsAppConversationStatus.pending:
        return 'En attente';
      case WhatsAppConversationStatus.resolved:
        return 'Résolue';
      case WhatsAppConversationStatus.closed:
        return 'Fermée';
    }
  }

  Color get color {
    switch (this) {
      case WhatsAppConversationStatus.active:
        return Colors.green;
      case WhatsAppConversationStatus.pending:
        return Colors.orange;
      case WhatsAppConversationStatus.resolved:
        return Colors.blue;
      case WhatsAppConversationStatus.closed:
        return Colors.grey;
    }
  }
}
