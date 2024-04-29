import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateAttemptPort {
  final StringIdentifier cardId;
  final bool isSuccess;

  const CreateAttemptPort({
    required this.cardId,
    required this.isSuccess,
  });
}
