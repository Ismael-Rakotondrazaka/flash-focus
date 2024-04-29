import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RemoveAttemptListPort {
  final List<IntIdentifier> attemptIds;

  const RemoveAttemptListPort({
    required this.attemptIds,
  });
}
