import 'package:flutter/material.dart';

@immutable
abstract class GetCategoryListPort {
  final List<int>? categoryIds;
  final String? name;
  final bool? includeRemoved;

  const GetCategoryListPort({
    this.name,
    this.includeRemoved,
    this.categoryIds,
  });
}
