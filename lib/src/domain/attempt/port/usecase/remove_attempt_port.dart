import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RemoveAttemptPort {
  final IntIdentifier attemptId;

  const RemoveAttemptPort({
    required this.attemptId,
  });
}
