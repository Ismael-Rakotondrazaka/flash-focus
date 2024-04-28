import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetCardPort {
  final StringIdentifier cardId;

  const GetCardPort({
    required this.cardId,
  });
}
