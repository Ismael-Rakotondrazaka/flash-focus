import 'package:flutter/material.dart';

@immutable
abstract class RemoveCategoryListPort {
  final List<int> categoryIds;

  const RemoveCategoryListPort({
    required this.categoryIds,
  });
}
