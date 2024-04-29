import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetAttemptListPort {
  final List<IntIdentifier>? attemptIds;
  final StringIdentifier? cardId;
  final AttemptResult? result;
  final DateTime? createdAt;
  final bool? includeRemoved;

  const GetAttemptListPort({
    this.attemptIds,
    this.cardId,
    this.result,
    this.createdAt,
    this.includeRemoved,
  });
}
