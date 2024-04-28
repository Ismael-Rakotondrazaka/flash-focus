import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class Identifier {
  const Identifier();
}

class StringIdentifier extends Identifier with EquatableMixin {
  final String value;

  const StringIdentifier({
    required this.value,
  });

  @override
  List<Object?> get props => [
        value,
      ];
}

class IntIdentifier extends Identifier with EquatableMixin {
  final int value;

  const IntIdentifier({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}
