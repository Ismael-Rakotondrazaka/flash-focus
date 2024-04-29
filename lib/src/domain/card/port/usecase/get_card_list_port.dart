import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetCardListPort {
  final List<StringIdentifier>? cardIds;
  final String? front;
  final String? back;
  final List<IntIdentifier>? categoryIds;
  final bool? includeRemoved;

  const GetCardListPort({
    this.cardIds,
    this.front,
    this.back,
    this.categoryIds,
    this.includeRemoved,
  });
}
