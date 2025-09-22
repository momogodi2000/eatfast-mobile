import 'package:json_annotation/json_annotation.dart';

class AiMessage {
  final String id;
  final String content;
  final AiMessageType type;
  final DateTime timestamp;
  final AiMessageSender sender;
  final List<AiSuggestion>? suggestions;
  final AiContext? context;
  final Map<String, dynamic>? metadata;
  final bool isTyping;

  const AiMessage({
    required this.id,
    required this.content,
    required this.type,
    required this.timestamp,
    required this.sender,
    this.suggestions,
    this.context,
    this.metadata,
    this.isTyping = false,
  });

  factory AiMessage.fromJson(Map<String, dynamic> json) {
    return AiMessage(
      id: json['id'] as String,
      content: json['content'] as String,
      type: AiMessageType.values.firstWhere((e) => e.name == json['type']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      sender: AiMessageSender.values.firstWhere((e) => e.name == json['sender']),
      suggestions: json['suggestions'] != null
          ? (json['suggestions'] as List<dynamic>)
              .map((e) => AiSuggestion.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      context: json['context'] != null
          ? AiContext.fromJson(json['context'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'] as Map<String, dynamic>?,
      isTyping: json['isTyping'] as bool? ?? false,
    );
  }

  AiMessage copyWith({
    String? id,
    String? content,
    AiMessageType? type,
    DateTime? timestamp,
    AiMessageSender? sender,
    List<AiSuggestion>? suggestions,
    AiContext? context,
    Map<String, dynamic>? metadata,
    bool? isTyping,
  }) {
    return AiMessage(
      id: id ?? this.id,
      content: content ?? this.content,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      sender: sender ?? this.sender,
      suggestions: suggestions ?? this.suggestions,
      context: context ?? this.context,
      metadata: metadata ?? this.metadata,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}

class AiSuggestion {
  final String id;
  final String text;
  final AiSuggestionType type;
  final String? action;
  final Map<String, dynamic>? data;

  const AiSuggestion({
    required this.id,
    required this.text,
    required this.type,
    this.action,
    this.data,
  });

  factory AiSuggestion.fromJson(Map<String, dynamic> json) {
    return AiSuggestion(
      id: json['id'] as String,
      text: json['text'] as String,
      type: AiSuggestionType.values.firstWhere((e) => e.name == json['type']),
      action: json['action'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );
  }

  AiSuggestion copyWith({
    String? id,
    String? text,
    AiSuggestionType? type,
    String? action,
    Map<String, dynamic>? data,
  }) {
    return AiSuggestion(
      id: id ?? this.id,
      text: text ?? this.text,
      type: type ?? this.type,
      action: action ?? this.action,
      data: data ?? this.data,
    );
  }
}

class AiContext {
  final String? orderId;
  final String? restaurantId;
  final String? userId;
  final AiContextType? type;
  final Map<String, dynamic>? data;

  const AiContext({
    this.orderId,
    this.restaurantId,
    this.userId,
    this.type,
    this.data,
  });

  factory AiContext.fromJson(Map<String, dynamic> json) {
    return AiContext(
      orderId: json['orderId'] as String?,
      restaurantId: json['restaurantId'] as String?,
      userId: json['userId'] as String?,
      type: json['type'] != null
          ? AiContextType.values.firstWhere((e) => e.name == json['type'])
          : null,
      data: json['data'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (orderId != null) 'orderId': orderId,
      if (restaurantId != null) 'restaurantId': restaurantId,
      if (userId != null) 'userId': userId,
      if (type != null) 'type': type!.name,
      if (data != null) 'data': data,
    };
  }

  AiContext copyWith({
    String? orderId,
    String? restaurantId,
    String? userId,
    AiContextType? type,
    Map<String, dynamic>? data,
  }) {
    return AiContext(
      orderId: orderId ?? this.orderId,
      restaurantId: restaurantId ?? this.restaurantId,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      data: data ?? this.data,
    );
  }
}

class AiChatSession {
  final String id;
  final String userId;
  final List<AiMessage> messages;
  final AiSessionStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final AiContext? context;
  final String? title;

  const AiChatSession({
    required this.id,
    required this.userId,
    required this.messages,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.context,
    this.title,
  });

  factory AiChatSession.fromJson(Map<String, dynamic> json) {
    return AiChatSession(
      id: json['id'] as String,
      userId: json['userId'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => AiMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: AiSessionStatus.values.firstWhere((e) => e.name == json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      context: json['context'] != null
          ? AiContext.fromJson(json['context'] as Map<String, dynamic>)
          : null,
      title: json['title'] as String?,
    );
  }

  bool get canShowSuggestions => messages.isEmpty || status == AiSessionStatus.active;

  List<AiSuggestion>? get suggestedActions => messages.isNotEmpty
    ? messages.last.suggestions
    : null;

  bool get shouldShowQuickOrders => context?.type == AiContextType.orderInquiry ||
    context?.type == AiContextType.restaurantSearch;

  bool get isTyping => false; // TODO: Implement typing indicator logic

  bool get isLoading => false; // TODO: Implement loading state logic

  AiChatSession copyWith({
    String? id,
    String? userId,
    List<AiMessage>? messages,
    AiSessionStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    AiContext? context,
    String? title,
  }) {
    return AiChatSession(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      messages: messages ?? this.messages,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      context: context ?? this.context,
      title: title ?? this.title,
    );
  }
}

enum AiMessageType {
  @JsonValue('text')
  text,
  @JsonValue('voice')
  voice,
  @JsonValue('image')
  image,
  @JsonValue('suggestion')
  suggestion,
  @JsonValue('action')
  action,
}

enum AiMessageSender {
  @JsonValue('user')
  user,
  @JsonValue('ai')
  ai,
  @JsonValue('system')
  system,
}

enum AiSuggestionType {
  @JsonValue('quick_reply')
  quickReply,
  @JsonValue('action')
  action,
  @JsonValue('order_action')
  orderAction,
  @JsonValue('navigation')
  navigation,
}

enum AiContextType {
  @JsonValue('order_inquiry')
  orderInquiry,
  @JsonValue('restaurant_search')
  restaurantSearch,
  @JsonValue('general_support')
  generalSupport,
  @JsonValue('payment_issue')
  paymentIssue,
  @JsonValue('delivery_tracking')
  deliveryTracking,
}

enum AiSessionStatus {
  @JsonValue('active')
  active,
  @JsonValue('closed')
  closed,
  @JsonValue('archived')
  archived,
}

extension AiMessageTypeExtension on AiMessageType {
  String get displayName {
    switch (this) {
      case AiMessageType.text:
        return 'Texte';
      case AiMessageType.voice:
        return 'Vocal';
      case AiMessageType.image:
        return 'Image';
      case AiMessageType.suggestion:
        return 'Suggestion';
      case AiMessageType.action:
        return 'Action';
    }
  }
}

extension AiSuggestionTypeExtension on AiSuggestionType {
  String get displayName {
    switch (this) {
      case AiSuggestionType.quickReply:
        return 'Réponse rapide';
      case AiSuggestionType.action:
        return 'Action';
      case AiSuggestionType.orderAction:
        return 'Action commande';
      case AiSuggestionType.navigation:
        return 'Navigation';
    }
  }
}

extension AiContextTypeExtension on AiContextType {
  String get displayName {
    switch (this) {
      case AiContextType.orderInquiry:
        return 'Demande de commande';
      case AiContextType.restaurantSearch:
        return 'Recherche restaurant';
      case AiContextType.generalSupport:
        return 'Support général';
      case AiContextType.paymentIssue:
        return 'Problème de paiement';
      case AiContextType.deliveryTracking:
        return 'Suivi de livraison';
    }
  }
}