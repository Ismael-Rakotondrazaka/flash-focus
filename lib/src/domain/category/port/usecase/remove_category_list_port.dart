import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RemoveCategoryListPort {
  final List<IntIdentifier> categoryIds;

  const RemoveCategoryListPort({
    required this.categoryIds,
  });
}
