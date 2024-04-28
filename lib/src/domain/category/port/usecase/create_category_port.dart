import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateCategoryPort {
  final IntIdentifier id;

  const CreateCategoryPort({
    required this.id,
  });
}
