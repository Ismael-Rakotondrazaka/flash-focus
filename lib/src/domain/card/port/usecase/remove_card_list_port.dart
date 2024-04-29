import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RemoveCardListPort {
  final List<StringIdentifier> cardIds;
  final bool? disableSoftDeleting;

  const RemoveCardListPort({
    required this.cardIds,
    this.disableSoftDeleting,
  });
}
