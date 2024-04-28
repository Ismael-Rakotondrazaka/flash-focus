import 'package:flutter/material.dart';

@immutable
abstract class CreateCardPort {
  final String? frontTitle;
  final String frontContent;
  final String? backTitle;
  final String backContent;

  const CreateCardPort({
    this.frontTitle,
    required this.frontContent,
    this.backTitle,
    required this.backContent,
  });
}
