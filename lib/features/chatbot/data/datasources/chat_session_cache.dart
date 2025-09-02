import 'dart:collection';

import 'package:flutter/material.dart';
import '../../../../core/cache/cache_policy.dart';
import '../../../../core/cache/cache_store.dart';
import '../../domain/entities/chat_session_entity.dart';
import '../../domain/entities/message_entity.dart';

/// Concrete implementation of CacheStore for ChatSession.
class ChatSessionCache extends CacheStore<String, ChatSession> {
  final CachePolicy _policy;

  /// Internal storage of sessions.
  final LinkedHashMap<String, ChatSession> _store = LinkedHashMap();

  ChatSessionCache({CachePolicy? policy})
    : _policy =
          policy ??
          const CachePolicy(
            maxItems: 10,
            evictionPolicy: EvictionPolicy.lru,
            keys: [],
          );

  @override
  Future<void> put(String key, ChatSession value) async {
    if (_store.containsKey(key)) {
      _store[key] = value;
      if (_policy.evictionPolicy == EvictionPolicy.lru) {
        _store.remove(key);
        _store[key] = value;
      }
    } else {
      if (_store.length >= _policy.maxItems) {
        _evict();
      }
      _store[key] = value;
    }
  }

  @override
  Future<ChatSession?> get(String key) async {
    final session = _store[key];
    if (session != null && _policy.evictionPolicy == EvictionPolicy.lru) {
      _store.remove(key);
      _store[key] = session;
    }
    return session;
  }

  @override
  Future<void> remove(String key) async {
    _store.remove(key);
  }

  @override
  Future<List<ChatSession>> getAll() async {
    return _store.values.toList(growable: false);
  }

  @override
  Future<void> clear() async {
    _store.clear();
  }

  /// Append a message to a session if it is not completed (read-only).
  Future<void> appendMessage(String sessionId, MessageEntity message) async {
    final session = _store[sessionId];
    if (session == null) return;

    if (session.status.toLowerCase() == 'completed') {
      debugPrint('⚠️ Cannot append: session $sessionId is read-only.');
      return;
    }

    final updated = ChatSession(
      id: session.id,
      title: session.title,
      status: session.status,
      statusColor: session.statusColor,
      timeStamp: session.timeStamp,
      messages: [...session.messages, message],
    );

    await put(sessionId, updated);
  }

  Future<void> completeSession(String sessionId) async {
    final session = _store[sessionId];
    if (session == null) return;

    final updated = ChatSession(
      id: session.id,
      title: session.title,
      status: 'completed',
      statusColor: Colors.grey,
      timeStamp: session.timeStamp,
      messages: session.messages,
    );

    await put(sessionId, updated);
  }

  void _evict() {
    if (_store.isEmpty) return;

    final firstKey = _store.keys.first;
    _store.remove(firstKey);
  }

  @override
  Future<String> addMessage(String key, ChatSession message) {
    // TODO: implement addMessage
    throw UnimplementedError();
  }

  @override
  Future<void> clearMessages(String key) {
    // TODO: implement clearMessages
    throw UnimplementedError();
  }

  @override
  Future<void> removeMessage(String key, String messageId) {
    // TODO: implement removeMessage
    throw UnimplementedError();
  }
}
