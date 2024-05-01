import 'package:flutter/material.dart';

@immutable
abstract class RemoveCardListPort {
  final List<String> cardIds;
  final bool? disableSoftDeleting;

  const RemoveCardListPort({
    required this.cardIds,
    this.disableSoftDeleting,
  });
}
