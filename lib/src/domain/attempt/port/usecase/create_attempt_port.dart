import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateAttemptPort {
  final StringIdentifier cardId;
  final AttemptResult result;

  const CreateAttemptPort({
    required this.cardId,
    required this.result,
  });
}
