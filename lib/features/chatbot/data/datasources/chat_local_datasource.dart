import '../../../../core/cache/cache_store.dart';
import '../models/chat_message_model.dart';

class ChatLocalDatasource {
  final CacheStore<String, List<ChatMessageModel>> cache;

  ChatLocalDatasource(this.cache);

  Future<void> addMessage(String sessionId, List<ChatMessageModel> messages) {
    return cache.addMessage(sessionId, messages);
  }

  Future<List<ChatMessageModel>?> get(String sessionId) {
    return cache.get(sessionId);
  }

  Future<List<List<ChatMessageModel>>> getAll() {
    return cache.getAll();
  }

  Future<void> clearSession(String sessionId) {
    return cache.clearMessages(sessionId);
  }

  Future<void> clearAllSessions() {
    return cache.clear();
  }
}
