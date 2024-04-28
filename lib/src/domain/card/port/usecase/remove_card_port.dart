import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RemoveCardPort {
  final StringIdentifier cardId;
  final bool? disableSoftDeleting;

  const RemoveCardPort({
    required this.cardId,
    this.disableSoftDeleting,
  });
}
