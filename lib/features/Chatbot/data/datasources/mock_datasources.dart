import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/guide_entity.dart';
import '../models/guide_model.dart';

abstract class GuideDataSource {
  Future<Either<GuideModel, FollowUpMessage>> fetchGuideCard();
}

class MockGuideDataSource implements GuideDataSource {
  int _step = 0;
  Map<String, dynamic>? _followup;
  Map<String, dynamic>? _compose;

  Future<void> _loadMockData() async {
    if (_followup != null && _compose != null) return;

    try {
      final guideCardString = await rootBundle.loadString('assets/mock/guide_card_mock.json');
      final Map<String, dynamic> data = json.decode(guideCardString) as Map<String, dynamic>;
      
      _followup = data['followup'] as Map<String, dynamic>?;
      _compose = data['compose'] as Map<String, dynamic>?;
      
      if (_followup == null || _compose == null) {
        throw Exception('Invalid mock data: missing followup or compose section in guide_card_mock.json');
      }
      
      _compose!['flag'] = _compose!['flag'] ?? 'GREEN';
    } catch (e) {
      throw Exception('Failed to load guide card data: $e');
    }
  }

  @override
  Future<Either<GuideModel, FollowUpMessage>> fetchGuideCard() async {
    await _loadMockData();

    if (_step < 2) {
      _step++;
      return Right(FollowUpMessage(conversationId: '23', question: _followup!['question'] as String));
    }
    return Left(GuideModel.fromJson(_compose! as Map<String, dynamic>));
  }
}
