import 'package:flutter/material.dart';

@immutable
abstract class CreateCategoryPort {
  final String name;

  const CreateCategoryPort({
    required this.name,
  });
}
