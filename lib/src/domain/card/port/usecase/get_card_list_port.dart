import 'package:flutter/material.dart';

@immutable
abstract class GetCardListPort {
  final List<String>? cardIds;
  final String? front;
  final String? back;
  final List<int>? categoryIds;
  final bool? includeRemoved;

  const GetCardListPort({
    this.cardIds,
    this.front,
    this.back,
    this.categoryIds,
    this.includeRemoved,
  });
}
