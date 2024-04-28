import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetAttemptListPort {
  final StringIdentifier? cardId;
  final AttemptResult? result;
  final DateTime? createdAt;

  const GetAttemptListPort({
    required this.cardId,
    required this.result,
    required this.createdAt,
  });
}
