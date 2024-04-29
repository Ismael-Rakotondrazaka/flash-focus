import 'package:flutter/material.dart';

@immutable
abstract class EditCategoryPort {
  final int id;
  final String name;

  const EditCategoryPort({
    required this.id,
    required this.name,
  });
}
