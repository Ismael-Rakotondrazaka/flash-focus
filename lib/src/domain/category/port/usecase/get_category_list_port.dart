import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetCategoryListPort {
  final List<IntIdentifier>? categoryIds;
  final String? name;
  final bool? includeRemoved;

  const GetCategoryListPort({
    this.name,
    this.includeRemoved,
    this.categoryIds,
  });
}
