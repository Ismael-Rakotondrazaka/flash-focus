import 'package:flutter/material.dart';

@immutable
abstract class RemoveCardPort {
  final String cardId;
  final bool? disableSoftDeleting;

  const RemoveCardPort({
    required this.cardId,
    this.disableSoftDeleting,
  });
}
