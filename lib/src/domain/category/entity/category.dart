import 'package:equatable/equatable.dart';
import 'package:flash_focus/src/core/entity/entity.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';

class CategoryEntity extends Entity<IntIdentifier> with EquatableMixin {
  final String name;
  CategoryEntity({
    super.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
