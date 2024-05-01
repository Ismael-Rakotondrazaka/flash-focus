import 'package:flash_focus/src/core/exception/identifier_not_assigned_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';

class Entity<T extends Identifier> {
  T? _id;

  Entity({
    T? id,
  }) : _id = id;

  T get id {
    if (_id == null) {
      throw IdentifierNotAssignedException();
    }

    return _id as T;
  }

  set id(T value) {
    _id = value;
  }
}
