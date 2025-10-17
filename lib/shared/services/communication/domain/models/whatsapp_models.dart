/// WhatsApp Communication Models
library;

/// WhatsApp message model
class WhatsAppMessage {
  final String id;
  final String to;
  final String? from;
  final String body;
  final WhatsAppMessageType type;
  final WhatsAppMessageStatus status;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime? sentAt;
  final DateTime? deliveredAt;
  final DateTime? readAt;

  const WhatsAppMessage({
    required this.id,
    required this.to,
    this.from,
    required this.body,
    required this.type,
    required this.status,
    this.metadata,
    required this.createdAt,
    this.sentAt,
    this.deliveredAt,
    this.readAt,
  });

  factory WhatsAppMessage.fromJson(Map<String, dynamic> json) {
    return WhatsAppMessage(
      id: json['id'] ?? '',
      to: json['to'] ?? '',
      from: json['from'],
      body: json['body'] ?? '',
      type: WhatsAppMessageType.fromString(json['type'] ?? 'text'),
      status: WhatsAppMessageStatus.fromString(json['status'] ?? 'pending'),
      metadata: json['metadata'],
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      sentAt: json['sentAt'] != null ? DateTime.parse(json['sentAt']) : null,
      deliveredAt: json['deliveredAt'] != null
          ? DateTime.parse(json['deliveredAt'])
          : null,
      readAt: json['readAt'] != null ? DateTime.parse(json['readAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'to': to,
      if (from != null) 'from': from,
      'body': body,
      'type': type.value,
      'status': status.value,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      if (sentAt != null) 'sentAt': sentAt!.toIso8601String(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt!.toIso8601String(),
      if (readAt != null) 'readAt': readAt!.toIso8601String(),
    };
  }
}

/// WhatsApp template model
class WhatsAppTemplate {
  final String id;
  final String name;
  final String language;
  final String category;
  final List<WhatsAppTemplateComponent> components;
  final WhatsAppTemplateStatus status;
  final DateTime createdAt;

  const WhatsAppTemplate({
    required this.id,
    required this.name,
    required this.language,
    required this.category,
    required this.components,
    required this.status,
    required this.createdAt,
  });

  factory WhatsAppTemplate.fromJson(Map<String, dynamic> json) {
    return WhatsAppTemplate(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      language: json['language'] ?? 'en',
      category: json['category'] ?? 'marketing',
      components:
          (json['components'] as List<dynamic>?)
              ?.map((c) => WhatsAppTemplateComponent.fromJson(c))
              .toList() ??
          [],
      status: WhatsAppTemplateStatus.fromString(json['status'] ?? 'pending'),
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}

/// WhatsApp template component
class WhatsAppTemplateComponent {
  final String type; // 'HEADER', 'BODY', 'FOOTER', 'BUTTONS'
  final String? text;
  final List<String>? parameters;

  const WhatsAppTemplateComponent({
    required this.type,
    this.text,
    this.parameters,
  });

  factory WhatsAppTemplateComponent.fromJson(Map<String, dynamic> json) {
    return WhatsAppTemplateComponent(
      type: json['type'] ?? '',
      text: json['text'],
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map((p) => p.toString())
          .toList(),
    );
  }
}

/// WhatsApp context for integration
class WhatsAppContext {
  final String businessPhoneNumber;
  final String apiKey;
  final bool isEnabled;

  const WhatsAppContext({
    required this.businessPhoneNumber,
    required this.apiKey,
    this.isEnabled = true,
  });
}

/// Message type enum
enum WhatsAppMessageType {
  text('text'),
  template('template'),
  image('image'),
  document('document');

  const WhatsAppMessageType(this.value);
  final String value;

  static WhatsAppMessageType fromString(String value) {
    return WhatsAppMessageType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => WhatsAppMessageType.text,
    );
  }
}

/// Message status enum
enum WhatsAppMessageStatus {
  pending('pending'),
  sent('sent'),
  delivered('delivered'),
  read('read'),
  failed('failed');

  const WhatsAppMessageStatus(this.value);
  final String value;

  static WhatsAppMessageStatus fromString(String value) {
    return WhatsAppMessageStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => WhatsAppMessageStatus.pending,
    );
  }
}

/// Template status enum
enum WhatsAppTemplateStatus {
  pending('pending'),
  approved('approved'),
  rejected('rejected');

  const WhatsAppTemplateStatus(this.value);
  final String value;

  static WhatsAppTemplateStatus fromString(String value) {
    return WhatsAppTemplateStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => WhatsAppTemplateStatus.pending,
    );
  }
}
