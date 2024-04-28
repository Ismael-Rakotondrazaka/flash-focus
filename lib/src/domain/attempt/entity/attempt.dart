import 'package:equatable/equatable.dart';
import 'package:flash_focus/src/core/entity/entity.dart';
import 'package:flash_focus/src/core/entity/removable_entity.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';

enum AttemptResult {
  success,
  failure,
}

class AttemptEntity extends Entity<IntIdentifier>
    with EquatableMixin, RemovableEntity {
  final StringIdentifier cardId;
  final AttemptResult result;
  late final DateTime createdAt;
  DateTime? deletedAt;

  AttemptEntity({
    super.id,
    required this.cardId,
    required this.result,
    DateTime? createdAt,
    this.deletedAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
  }

  @override
  List<Object?> get props => [
        id,
        cardId,
        result,
        createdAt,
      ];

  @override
  void remove() {
    deletedAt = DateTime.now();
  }
}
