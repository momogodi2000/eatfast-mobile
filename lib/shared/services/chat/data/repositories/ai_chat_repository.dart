import '../../domain/models/ai_message.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';

class AiChatRepository {
  final ApiClient _apiClient = ApiClient();

  Future<List<AiChatSession>> getChatSessions() async {
    try {
      final response = await _apiClient.get('/ai-chat/sessions');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => AiChatSession.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load chat sessions: $error');
    }
  }

  Future<AiChatSession> getChatSession(String sessionId) async {
    try {
      final response = await _apiClient.get('/ai-chat/sessions/$sessionId');
      return AiChatSession.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to load chat session: $error');
    }
  }

  Future<AiChatSession> createChatSession({AiContext? context}) async {
    try {
      final response = await _apiClient.post(
        '/ai-chat/sessions',
        data: {
          if (context != null) 'context': context.toJson(),
        },
      );
      return AiChatSession.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to create chat session: $error');
    }
  }

  Future<AiMessage> sendMessage(
    String sessionId,
    String content, {
    AiMessageType type = AiMessageType.text,
  }) async {
    try {
      final response = await _apiClient.post(
        '/ai-chat/sessions/$sessionId/messages',
        data: {
          'content': content,
          'type': type.name,
        },
      );
      return AiMessage.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to send message: $error');
    }
  }

  Future<void> executeAction(String action, Map<String, dynamic>? data) async {
    try {
      await _apiClient.post(
        '/ai-chat/actions/$action',
        data: data ?? {},
      );
    } catch (error) {
      throw Exception('Failed to execute action: $error');
    }
  }

  Future<void> closeSession(String sessionId) async {
    try {
      await _apiClient.post('/ai-chat/sessions/$sessionId/close');
    } catch (error) {
      throw Exception('Failed to close session: $error');
    }
  }

  Future<void> archiveSession(String sessionId) async {
    try {
      await _apiClient.post('/ai-chat/sessions/$sessionId/archive');
    } catch (error) {
      throw Exception('Failed to archive session: $error');
    }
  }

  Future<List<AiSuggestion>> getSuggestions(String sessionId) async {
    try {
      final response = await _apiClient.get('/ai-chat/sessions/$sessionId/suggestions');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => AiSuggestion.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to get suggestions: $error');
    }
  }
}
