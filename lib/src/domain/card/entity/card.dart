import 'package:equatable/equatable.dart';
import 'package:flash_focus/src/core/entity/entity.dart';
import 'package:flash_focus/src/core/entity/removable_entity.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/util/date/copy_date_time.dart';
import 'package:flutter/foundation.dart';

class CardSide extends Equatable {
  final String? title;
  final String content;

  const CardSide({
    this.title,
    required this.content,
  });

  @override
  List<Object?> get props => [
        title,
        content,
      ];
}
class CardEntity extends Entity<StringIdentifier>
    with EquatableMixin, RemovableEntity {
  final CardSide front;
  final CardSide back;
  late final DateTime createdAt;
  late final DateTime updatedAt;
  DateTime? deletedAt;
  final IntIdentifier? categoryId;
  final Category? category;

  CardEntity({
    super.id,
    required this.front,
    required this.back,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
    this.categoryId,
    this.category,
  }) {
    if (createdAt == null) {
      this.createdAt = DateTime.now();

      this.updatedAt = copyDateTime(this.createdAt);
    } else {
      this.createdAt = createdAt;
    }

    if (updatedAt == null) {
      this.updatedAt = copyDateTime(this.createdAt);
    } else {
      this.updatedAt = updatedAt;
    }
  }

  @override
  List<Object?> get props => [
        id,
        front,
        back,
      ];

  @override
  void remove() {
    deletedAt = DateTime.now();
  }
}
