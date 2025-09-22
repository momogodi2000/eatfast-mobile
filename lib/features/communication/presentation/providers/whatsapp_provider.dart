import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/whatsapp_message.dart';

final whatsappRepositoryProvider = Provider<WhatsAppRepository>((ref) {
  return WhatsAppRepository();
});

final whatsappProvider = StateNotifierProvider<WhatsAppNotifier, WhatsAppState>((ref) {
  final repository = ref.watch(whatsappRepositoryProvider);
  return WhatsAppNotifier(repository);
});

class WhatsAppNotifier extends StateNotifier<WhatsAppState> {
  final WhatsAppRepository _repository;

  WhatsAppNotifier(this._repository) : super(const WhatsAppState());

  Future<WhatsAppMessage> createMessage({
    required String phoneNumber,
    required WhatsAppTemplate template,
    String? orderId,
    String? restaurantName,
    String? driverName,
    Map<String, dynamic>? customData,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final message = WhatsAppMessage(
        phoneNumber: phoneNumber,
        message: template.getTemplate(
          orderId: orderId,
          restaurantName: restaurantName,
          driverName: driverName,
          customData: customData,
        ),
        template: template,
        whatsappUrl: _generateWhatsAppUrl(phoneNumber, template.getTemplate(
          orderId: orderId,
          restaurantName: restaurantName,
          driverName: driverName,
          customData: customData,
        )),
      );

      state = state.copyWith(
        isLoading: false,
        lastMessage: message,
      );

      return message;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  String _generateWhatsAppUrl(String phoneNumber, String message) {
    final encodedMessage = Uri.encodeComponent(message);
    return 'https://wa.me/$phoneNumber?text=$encodedMessage';
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<WhatsAppMessage> createSupportMessage({
    String? orderId,
  }) async {
    return createMessage(
      phoneNumber: '+237123456789', // Support phone number
      template: WhatsAppTemplate.supportGeneral,
      orderId: orderId,
    );
  }

  Future<WhatsAppMessage> createRestaurantMessage({
    required String restaurantPhone,
    String? orderId,
    String? restaurantName,
  }) async {
    return createMessage(
      phoneNumber: restaurantPhone,
      template: WhatsAppTemplate.restaurantContact,
      orderId: orderId,
      restaurantName: restaurantName,
    );
  }

  Future<WhatsAppMessage> createDriverMessage({
    required String driverPhone,
    String? orderId,
    String? driverName,
  }) async {
    return createMessage(
      phoneNumber: driverPhone,
      template: WhatsAppTemplate.driverContact,
      orderId: orderId,
      driverName: driverName,
    );
  }

  Future<WhatsAppMessage> createTemplateMessage({
    required String phoneNumber,
    required WhatsAppTemplate template,
    String? orderId,
    String? restaurantName,
    String? driverName,
  }) async {
    return createMessage(
      phoneNumber: phoneNumber,
      template: template,
      orderId: orderId,
      restaurantName: restaurantName,
      driverName: driverName,
    );
  }

  Future<void> trackInteraction(String messageId) async {
    // Track WhatsApp interaction for analytics
    // This would typically send to backend
  }
}

class WhatsAppState {
  final bool isLoading;
  final WhatsAppMessage? lastMessage;
  final String? error;

  const WhatsAppState({
    this.isLoading = false,
    this.lastMessage,
    this.error,
  });

  WhatsAppState copyWith({
    bool? isLoading,
    WhatsAppMessage? lastMessage,
    String? error,
  }) {
    return WhatsAppState(
      isLoading: isLoading ?? this.isLoading,
      lastMessage: lastMessage ?? this.lastMessage,
      error: error,
    );
  }
}

class WhatsAppRepository {
  Future<void> sendMessage(WhatsAppMessage message) async {
    // Implementation would connect to WhatsApp Business API
    await Future.delayed(const Duration(milliseconds: 500));
  }
}