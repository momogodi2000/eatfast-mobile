import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../domain/models/ai_message.dart';
import 'package:eatfast_mobile/shared/services/chat/data/repositories/ai_chat_repository.dart';

final aiChatRepositoryProvider = Provider<AiChatRepository>((ref) {
  return AiChatRepository();
});

final speechToTextProvider = Provider<SpeechToText>((ref) {
  return SpeechToText();
});

final aiChatProvider = StateNotifierProvider<AiChatNotifier, AiChatState>((ref) {
  final repository = ref.watch(aiChatRepositoryProvider);
  final speechToText = ref.watch(speechToTextProvider);
  return AiChatNotifier(repository, speechToText);
});

final aiChatSessionsProvider = FutureProvider<List<AiChatSession>>((ref) async {
  final repository = ref.watch(aiChatRepositoryProvider);
  return repository.getChatSessions();
});

class AiChatNotifier extends StateNotifier<AiChatState> {
  final AiChatRepository _repository;
  final SpeechToText _speechToText;

  AiChatNotifier(this._repository, this._speechToText)
      : super(const AiChatState()) {
    _initializeSpeech();
  }

  Future<void> _initializeSpeech() async {
    try {
      final available = await _speechToText.initialize();
      state = state.copyWith(isSpeechAvailable: available);
    } catch (error) {
      state = state.copyWith(isSpeechAvailable: false);
    }
  }

  Future<void> createSession({AiContext? context}) async {
    try {
      state = state.copyWith(isLoading: true);
      final session = await _repository.createChatSession(context: context);
      state = state.copyWith(
        currentSession: session,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<void> loadSession(String sessionId) async {
    try {
      state = state.copyWith(isLoading: true);
      final session = await _repository.getChatSession(sessionId);
      state = state.copyWith(
        currentSession: session,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<void> sendMessage(String content, {AiMessageType type = AiMessageType.text}) async {
    if (state.currentSession == null) {
      await createSession();
    }

    if (content.trim().isEmpty) return;

    try {
      final userMessage = AiMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: content,
        type: type,
        timestamp: DateTime.now(),
        sender: AiMessageSender.user,
      );

      // Add user message to current session
      final updatedMessages = [...state.currentSession!.messages, userMessage];
      final updatedSession = state.currentSession!.copyWith(messages: updatedMessages);
      state = state.copyWith(currentSession: updatedSession);

      // Show AI typing
      state = state.copyWith(isAiTyping: true);

      // Send to AI and get response
      final response = await _repository.sendMessage(
        state.currentSession!.id,
        content,
        type: type,
      );

      // Add AI response to session
      final finalMessages = [...updatedMessages, response];
      final finalSession = updatedSession.copyWith(messages: finalMessages);

      state = state.copyWith(
        currentSession: finalSession,
        isAiTyping: false,
      );
    } catch (error) {
      state = state.copyWith(
        isAiTyping: false,
        error: error.toString(),
      );
    }
  }

  Future<void> sendVoiceMessage() async {
    if (!state.isSpeechAvailable) return;

    try {
      state = state.copyWith(isListening: true);

      final available = await _speechToText.listen(
        onResult: (result) {
          if (result.finalResult) {
            sendMessage(result.recognizedWords, type: AiMessageType.voice);
          }
        },
        localeId: 'fr-FR',
      );

      if (!available) {
        state = state.copyWith(isListening: false);
      }
    } catch (error) {
      state = state.copyWith(
        isListening: false,
        error: error.toString(),
      );
    }
  }

  void stopListening() {
    _speechToText.stop();
    state = state.copyWith(isListening: false);
  }

  Future<void> handleSuggestion(AiSuggestion suggestion) async {
    switch (suggestion.type) {
      case AiSuggestionType.quickReply:
        await sendMessage(suggestion.text);
        break;
      case AiSuggestionType.action:
      case AiSuggestionType.orderAction:
      case AiSuggestionType.navigation:
        // Handle action suggestions
        if (suggestion.action != null) {
          await _repository.executeAction(suggestion.action!, suggestion.data);
        }
        break;
    }
  }

  Future<void> closeSession() async {
    if (state.currentSession != null) {
      try {
        await _repository.closeSession(state.currentSession!.id);
        state = state.copyWith(currentSession: null);
      } catch (error) {
        state = state.copyWith(error: error.toString());
      }
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

class AiChatState {
  final AiChatSession? currentSession;
  final bool isLoading;
  final bool isAiTyping;
  final bool isListening;
  final bool isSpeechAvailable;
  final String? error;

  const AiChatState({
    this.currentSession,
    this.isLoading = false,
    this.isAiTyping = false,
    this.isListening = false,
    this.isSpeechAvailable = false,
    this.error,
  });

  AiChatState copyWith({
    AiChatSession? currentSession,
    bool? isLoading,
    bool? isAiTyping,
    bool? isListening,
    bool? isSpeechAvailable,
    String? error,
  }) {
    return AiChatState(
      currentSession: currentSession ?? this.currentSession,
      isLoading: isLoading ?? this.isLoading,
      isAiTyping: isAiTyping ?? this.isAiTyping,
      isListening: isListening ?? this.isListening,
      isSpeechAvailable: isSpeechAvailable ?? this.isSpeechAvailable,
      error: error,
    );
  }
}
