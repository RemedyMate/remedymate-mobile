import '../../features/Chatbot/domain/entities/chat_session_entity.dart';
import '../../features/Chatbot/domain/entities/message_entity.dart';
import 'in_memory_cache.dart';

extension ChatCacheExtensions on InMemoryCache<String, ChatSessionEntity> {
  Future<void> putMessage(String chatId, MessageEntity message) async {
    final existing = await get(chatId);

    if (existing != null) {
      // Append to existing chat
      final updated = existing.addMessage(message);
      await put(chatId, updated);
    } else {
      // Create new chat session
      await put(chatId, ChatSession(chatId, [message]));
    }
  }
}
