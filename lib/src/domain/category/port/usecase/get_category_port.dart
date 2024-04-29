import 'package:flutter/material.dart';

@immutable
abstract class GetCategoryPort {
  final int id;

  const GetCategoryPort({
    required this.id,
  });
}
