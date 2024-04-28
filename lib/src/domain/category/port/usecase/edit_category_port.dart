import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EditCategoryPort {
  final IntIdentifier id;
  final String name;

  const EditCategoryPort({
    required this.id,
    required this.name,
  });
}
