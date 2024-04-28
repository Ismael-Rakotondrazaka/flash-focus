import 'package:flutter/material.dart';

@immutable
abstract class GetCategoryListPort {
  final String? name;
  final bool? includeRemoved;

  const GetCategoryListPort({
    this.name,
    this.includeRemoved,
  });
}
