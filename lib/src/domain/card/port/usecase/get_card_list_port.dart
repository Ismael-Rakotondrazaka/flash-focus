import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetCardListPort {
  final String? front;
  final String? back;
  final List<IntIdentifier>? categoryIds;

  const GetCardListPort({
    this.front,
    this.back,
    this.categoryIds,
  });
}
