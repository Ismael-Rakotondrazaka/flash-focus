import 'package:flutter/material.dart';

@immutable
abstract class GetCardPort {
  final String cardId;
  final bool? includeRemoved;

  const GetCardPort({
    required this.cardId,
    this.includeRemoved,
  });
}
