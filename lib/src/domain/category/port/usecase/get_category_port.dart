import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetCategoryPort {
  final IntIdentifier id;

  const GetCategoryPort({
    required this.id,
  });
}
