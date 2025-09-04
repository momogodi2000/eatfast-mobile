import '../models/group_order.dart';

abstract class GroupOrderRepository {
  /// Group Order Management
  Future<GroupOrder> createGroupOrder({
    required String restaurantId,
    required String organizerId,
    required DateTime orderDeadline,
    String? groupName,
    String? description,
    int maxParticipants = 10,
  });
  
  Future<GroupOrder?> getGroupOrder(String groupOrderId);
  Future<List<GroupOrder>> getUserGroupOrders(String userId);
  Future<List<GroupOrder>> getOrganizedGroupOrders(String userId);
  Future<List<GroupOrder>> getParticipatedGroupOrders(String userId);
  Future<void> updateGroupOrder(String groupOrderId, Map<String, dynamic> updates);
  Future<void> cancelGroupOrder(String groupOrderId, String reason);
  
  /// Participant Management
  Future<void> addParticipant({
    required String groupOrderId,
    required String userId,
    ParticipantRole role = ParticipantRole.participant,
  });
  
  Future<void> removeParticipant(String groupOrderId, String userId);
  Future<void> updateParticipantStatus(
    String groupOrderId,
    String userId,
    ParticipantStatus status,
  );
  
  Future<GroupOrderParticipant?> getParticipant(
    String groupOrderId,
    String userId,
  );
  
  Future<List<GroupOrderParticipant>> getGroupParticipants(String groupOrderId);
  
  /// Invitation Management
  Future<GroupOrderInvitation> sendInvitation({
    required String groupOrderId,
    required String invitedEmail,
    required String invitedBy,
    String? personalMessage,
  });
  
  Future<List<GroupOrderInvitation>> getGroupInvitations(String groupOrderId);
  Future<List<GroupOrderInvitation>> getUserInvitations(String userId);
  Future<void> respondToInvitation(
    String invitationId,
    InvitationStatus response,
  );
  
  Future<String> generateInviteLink(String groupOrderId);
  Future<GroupOrder?> joinGroupByInviteCode(String inviteCode, String userId);
  
  /// Order Items Management
  Future<void> addItemToGroupOrder({
    required String groupOrderId,
    required String userId,
    required String menuItemId,
    required int quantity,
    List<String> customizations = const [],
    String? specialInstructions,
  });
  
  Future<void> removeItemFromGroupOrder(String groupOrderId, String itemId);
  Future<void> updateGroupOrderItem({
    required String groupOrderId,
    required String itemId,
    int? quantity,
    List<String>? customizations,
    String? specialInstructions,
  });
  
  Future<List<GroupOrderItem>> getGroupOrderItems(String groupOrderId);
  Future<List<GroupOrderItem>> getUserItemsInGroup(
    String groupOrderId,
    String userId,
  );
  
  /// Payment Management
  Future<GroupOrderPayment> calculateGroupPayment({
    required String groupOrderId,
    required PaymentSplitType splitType,
    Map<String, double>? customAmounts,
  });
  
  Future<void> processGroupPayment(
    String groupOrderId,
    PaymentMethod paymentMethod,
  );
  
  Future<void> processIndividualPayment({
    required String groupOrderId,
    required String userId,
    required double amount,
    required PaymentMethod paymentMethod,
  });
  
  Future<List<PaymentTransaction>> getGroupPaymentTransactions(
    String groupOrderId,
  );
  
  Future<void> sendPaymentReminder(String groupOrderId, String userId);
  
  /// Order Lifecycle
  Future<void> finalizeGroupOrder(String groupOrderId);
  Future<void> confirmGroupOrder(String groupOrderId);
  Future<void> updateOrderStatus(String groupOrderId, GroupOrderStatus status);
  Future<void> notifyStatusChange(String groupOrderId, GroupOrderStatus status);
  
  /// Chat and Communication
  Future<void> sendGroupMessage({
    required String groupOrderId,
    required String senderId,
    required String message,
    MessageType type = MessageType.text,
    String? replyToMessageId,
    List<String> mentions = const [],
  });
  
  Future<List<GroupOrderChat>> getGroupMessages(
    String groupOrderId, {
    int limit = 50,
    String? lastMessageId,
  });
  
  Stream<GroupOrderChat> getGroupMessagesStream(String groupOrderId);
  Future<void> markMessageAsRead(String messageId, String userId);
  
  /// Templates
  Future<GroupOrderTemplate> createTemplate({
    required String templateName,
    required String restaurantId,
    required String createdBy,
    List<String> defaultItems = const [],
    String? description,
    int? maxParticipants,
    PaymentSplitType? defaultSplitType,
  });
  
  Future<List<GroupOrderTemplate>> getUserTemplates(String userId);
  Future<List<GroupOrderTemplate>> getPublicTemplates();
  Future<GroupOrder> createGroupOrderFromTemplate(
    String templateId,
    String organizerId,
    DateTime orderDeadline,
  );
  
  Future<void> updateTemplate(String templateId, Map<String, dynamic> updates);
  Future<void> deleteTemplate(String templateId);
  
  /// Statistics and Analytics
  Future<GroupOrderStats> getUserGroupOrderStats(String userId);
  Future<Map<String, dynamic>> getGroupOrderAnalytics(String groupOrderId);
  Future<List<Map<String, dynamic>>> getRestaurantGroupOrderStats(
    String restaurantId, {
    DateTime? startDate,
    DateTime? endDate,
  });
  
  /// Real-time Updates
  Stream<GroupOrder> getGroupOrderStream(String groupOrderId);
  Stream<List<GroupOrderParticipant>> getParticipantsStream(String groupOrderId);
  Stream<List<GroupOrderItem>> getItemsStream(String groupOrderId);
  Stream<GroupOrderPayment> getPaymentStream(String groupOrderId);
  
  /// Search and Discovery
  Future<List<GroupOrder>> searchPublicGroupOrders({
    String? restaurantId,
    String? location,
    List<String>? tags,
    GroupOrderStatus? status,
    int limit = 20,
  });
  
  Future<List<GroupOrder>> getNearbyGroupOrders({
    required double latitude,
    required double longitude,
    double radiusKm = 5.0,
  });
  
  /// Notifications
  Future<void> subscribeToGroupNotifications(String groupOrderId, String userId);
  Future<void> unsubscribeFromGroupNotifications(String groupOrderId, String userId);
  Future<void> sendBulkNotification(
    String groupOrderId,
    String title,
    String message,
  );
  
  /// Data Export and Import
  Future<Map<String, dynamic>> exportGroupOrderData(String groupOrderId);
  Future<void> importGroupOrderData(Map<String, dynamic> data);
  
  /// Cleanup and Maintenance
  Future<void> cleanupExpiredGroupOrders();
  Future<void> archiveCompletedGroupOrders(DateTime beforeDate);
  
  /// Dispose
  Future<void> dispose();
}