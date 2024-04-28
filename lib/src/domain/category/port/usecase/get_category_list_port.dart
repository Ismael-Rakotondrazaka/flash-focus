import 'package:flutter/material.dart';

@immutable
abstract class GetCategoryListPort {
  final String? name;

  const GetCategoryListPort({
    this.name,
  });
}
