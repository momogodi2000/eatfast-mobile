import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/chat_message.dart';
import '../providers/ai_chat_provider.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/chat_input_field.dart';
import '../widgets/typing_indicator.dart';
import '../widgets/suggested_actions_widget.dart';
import '../widgets/quick_order_suggestions.dart';
import 'package:eatfast_mobile/shared/widgets/common/loading_widget.dart';

class AiChatScreen extends ConsumerStatefulWidget {
  final String? sessionId;
  final ChatContext? initialContext;

  const AiChatScreen({
    super.key,
    this.sessionId,
    this.initialContext,
  });

  @override
  ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends ConsumerState<AiChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _inputFocusNode = FocusNode();

  String? _currentSessionId;
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
    _currentSessionId = widget.sessionId;

    // Initialize chat session if none provided
    if (_currentSessionId == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _initializeNewSession();
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  void _initializeNewSession() async {
    await ref.read(aiChatProvider.notifier).createSession(
      context: widget.initialContext,
    );
    final sessionId = ref.read(aiChatProvider).currentSession?.id;
    if (mounted && sessionId != null) {
      setState(() {
        _currentSessionId = sessionId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentSessionId == null) {
      return const Scaffold(
        body: LoadingWidget(),
      );
    }

    final chatState = ref.watch(aiChatProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.smart_toy,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assistant EatFast',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Alimenté par l\'IA',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _showRestartDialog(),
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'clear',
                child: ListTile(
                  leading: Icon(Icons.clear_all),
                  title: Text('Effacer la conversation'),
                ),
              ),
              const PopupMenuItem(
                value: 'export',
                child: ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Exporter la conversation'),
                ),
              ),
              const PopupMenuItem(
                value: 'feedback',
                child: ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('Donner un avis'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: _buildChatInterface(chatState.currentSession!),
    );
  }

  Widget _buildChatInterface(ChatSession session) {
    return Column(
      children: [
        // Chat messages area
        Expanded(
          child: session.messages.isEmpty
              ? _buildWelcomeState()
              : _buildMessagesList(session.messages),
        ),

        // Suggested actions (when no active conversation)
        if (session.messages.isEmpty || session.canShowSuggestions)
          SuggestedActionsWidget(
            suggestions: session.suggestedActions ?? [],
            onSuggestionTap: _handleSuggestedAction,
          ),

        // Quick order suggestions (context-aware)
        if (session.shouldShowQuickOrders)
          QuickOrderSuggestions(
            onSuggestionTap: _handleOrderSuggestion,
          ),

        // Typing indicator
        if (session.isTyping)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TypingIndicator(),
          ),

        // Input area
        _buildInputArea(session),
      ],
    );
  }

  Widget _buildWelcomeState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.smart_toy,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Bonjour ! 👋',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Je suis votre assistant intelligent EatFast. Je peux vous aider à commander, trouver des restaurants, suivre vos livraisons et bien plus encore !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Que puis-je faire pour vous aujourd\'hui ?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList(List<ChatMessage> messages) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ChatMessageBubble(
          message: message,
        );
      },
    );
  }

  Widget _buildInputArea(ChatSession session) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Attachment button
              IconButton(
                onPressed: _handleAttachment,
                icon: const Icon(Icons.attach_file),
                color: Theme.of(context).primaryColor,
              ),

              // Text input
              Expanded(
                child: ChatInputField(
                  controller: _messageController,
                  onSend: () => _handleMessageSubmit(_messageController.text),
                  onVoiceInput: _handleVoiceInput,
                  isVoiceAvailable: true,
                ),
              ),

              const SizedBox(width: 8),

              // Send button or voice input
              if (_isComposing)
                IconButton(
                  onPressed: session.isLoading ? null : () => _handleMessageSubmit(_messageController.text),
                  icon: session.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.send),
                  color: Theme.of(context).primaryColor,
                )
              else
                IconButton(
                  onPressed: _handleVoiceInput,
                  icon: const Icon(Icons.mic),
                  color: Theme.of(context).primaryColor,
                ),
            ],
          ),
        ),
      ),
    );
  }



  void _handleMessageSubmit(String text) {
    if (text.trim().isEmpty || _currentSessionId == null) return;

    final message = text.trim();
    _messageController.clear();
    setState(() {
      _isComposing = false;
    });

    // Send message
    ref.read(aiChatProvider.notifier).sendMessage(message);

    // Auto-scroll to bottom
    _scrollToBottom();
  }

  void _handleSuggestedAction(AiSuggestion suggestion) {
    ref.read(aiChatProvider.notifier).handleSuggestion(suggestion);
    _scrollToBottom();
  }

  void _handleOrderSuggestion(String suggestion) {
    ref.read(aiChatProvider.notifier).handleSuggestion(AiSuggestion(
      id: 'quick_$suggestion',
      text: suggestion,
      type: AiSuggestionType.action,
      data: {'text': suggestion},
    ));
    _scrollToBottom();
  }



  void _handleAttachment() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Prendre une photo'),
              onTap: () {
                Navigator.pop(context);
                _handleImageCapture();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choisir depuis la galerie'),
              onTap: () {
                Navigator.pop(context);
                _handleImageSelection();
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Partager ma position'),
              onTap: () {
                Navigator.pop(context);
                _handleLocationShare();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleVoiceInput() {
    // TODO: Implement voice input functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Entrée vocale bientôt disponible')),
    );
  }

  void _handleImageCapture() {
    // TODO: Implement camera capture
  }

  void _handleImageSelection() {
    // TODO: Implement gallery selection
  }

  void _handleLocationShare() {
    // TODO: Implement location sharing
  }

  void _showRestartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nouvelle conversation'),
        content: const Text('Voulez-vous commencer une nouvelle conversation ? La conversation actuelle sera sauvegardée.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _initializeNewSession();
            },
            child: const Text('Nouvelle conversation'),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'clear':
        _showClearDialog();
        break;
      case 'export':
        _exportConversation();
        break;
      case 'feedback':
        _showFeedbackDialog(null);
        break;
    }
  }

  void _showClearDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Effacer la conversation'),
        content: const Text('Cette action est irréversible. Voulez-vous continuer ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (_currentSessionId != null) {
                ref.read(aiChatProvider.notifier).closeSession();
              }
            },
            child: const Text('Effacer'),
          ),
        ],
      ),
    );
  }

  void _exportConversation() {
    if (_currentSessionId != null) {
      // TODO: Implement export conversation functionality
    }
  }

  void _showFeedbackDialog(ChatMessage? message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Donner un avis'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Comment évaluez-vous cette réponse ?'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _submitFeedback(message, 'negative');
                  },
                  icon: const Icon(Icons.thumb_down, color: Colors.red),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _submitFeedback(message, 'positive');
                  },
                  icon: const Icon(Icons.thumb_up, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitFeedback(ChatMessage? message, String type) {
    if (_currentSessionId != null) {
    // TODO: Implement feedback submission functionality
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Merci pour votre avis !')),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
