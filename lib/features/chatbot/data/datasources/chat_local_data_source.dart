import '../../../../core/cache/cache_store.dart';
import '../models/chat_session_model.dart';
import '../models/message_model.dart';

class ChatLocalDataSource {
  final CacheStore<String, dynamic> _cacheStore;

  ChatLocalDataSource(this._cacheStore);

  Future<void> cacheChatSession(ChatSessionModel chatSession) async {
    await _cacheStore.put(chatSession.id, chatSession);
  }

  Future<void> deleteChatSession(ChatSessionModel chatSession) async {
    await _cacheStore.remove(chatSession.id);
  }

  Future<ChatSessionModel?> getChatSession(String chatSessionId) async {
    return _cacheStore.get(chatSessionId) as ChatSessionModel?;
  }
  Future<List<ChatSessionModel>> getAllChatSessions() async {
    final all = await _cacheStore.getAll();
    return all.cast<ChatSessionModel>();
  }

  Future<String> addMessage(String chatSessionId, MessageModel message) async {
    return _cacheStore.addMessage(chatSessionId, message);
  }

  Future<void> clearAllSessions() async {
    await _cacheStore.clear();
  }

  Future<void> removeMessage(String chatSessionId, String messageId) async {
    await _cacheStore.removeMessage(chatSessionId, messageId);
  }

  Future<void> clearMessages(String chatSessionId) async {
    await _cacheStore.clearMessages(chatSessionId);
  }
}
