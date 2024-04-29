import 'package:flutter/material.dart';

@immutable
abstract class EditCardPort {
  final String cardId;
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
