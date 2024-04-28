import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EditCardPort {
  final StringIdentifier cardId;
  final String? frontTitle;
  final String? frontContent;
  final String? backTitle;
  final String? backContent;

  const EditCardPort({
    required this.cardId,
    this.frontTitle,
    this.frontContent,
    this.backTitle,
    this.backContent,
  });
}
