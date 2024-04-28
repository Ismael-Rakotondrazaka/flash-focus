import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateCardPort {
  final String? frontTitle;
  final String frontContent;
  final String? backTitle;
  final String backContent;
  final IntIdentifier? categoryId;

  const CreateCardPort({
    this.frontTitle,
    required this.frontContent,
    this.backTitle,
    required this.backContent,
    this.categoryId,
  });
}
