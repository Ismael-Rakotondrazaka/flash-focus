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

  static List<StringIdentifier> fromList(List<String> values) {
    return values
        .map(
          (String value) => StringIdentifier(value: value),
        )
        .toList();
  }

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

  static List<IntIdentifier> fromList(List<int> values) {
    return values
        .map(
          (int value) => IntIdentifier(value: value),
        )
        .toList();
  }

  @override
  List<Object?> get props => [value];
}
