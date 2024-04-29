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

  StringIdentifier.from(this.value);

  static StringIdentifier? tryFrom(String? value) {
    return value is String ? StringIdentifier(value: value) : null;
  }

  static List<StringIdentifier>? tryFromList(List<String?>? values) {
    if (values == null) {
      return null;
    } else {
      List<StringIdentifier> result = [];

      for (var value in values) {
        if (value is String) {
          result.add(StringIdentifier(value: value));
        }
      }

      return result;
    }
  }

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

  IntIdentifier.from(this.value);

  static IntIdentifier? tryFrom(int? value) {
    return value is int ? IntIdentifier(value: value) : null;
  }

  static List<IntIdentifier>? tryFromList(List<int?>? values) {
    if (values == null) {
      return null;
    } else {
      List<IntIdentifier> result = [];

      for (var value in values) {
        if (value is int) {
          result.add(IntIdentifier(value: value));
        }
      }

      return result;
    }
  }

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
