import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetAttemptListPort {
  final List<IntIdentifier>? attemptIds;
  final StringIdentifier? cardId;
  final bool? isSuccess;
  final DateTime? createdAt;
  final bool? includeRemoved;

  const GetAttemptListPort({
    this.attemptIds,
    this.cardId,
    this.isSuccess,
    this.createdAt,
    this.includeRemoved,
  });
}
