import 'package:equatable/equatable.dart';
import 'package:flash_focus/src/core/entity/entity.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';

class CategoryEntity extends Entity<IntIdentifier> with EquatableMixin {
  late String _name;

  CategoryEntity({
    super.id,
    required String name,
  }) {
    _name = name;
  }

  String get name {
    return _name;
  }

  void edit({
    required String name,
  }) {
    _name = name;
  }

  @override
  List<Object?> get props => [
        id,
        _name,
      ];
}
