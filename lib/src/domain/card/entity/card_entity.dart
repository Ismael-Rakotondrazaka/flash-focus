import 'package:equatable/equatable.dart';
import 'package:flash_focus/src/core/entity/entity.dart';
import 'package:flash_focus/src/core/entity/removable_entity.dart';
import 'package:flash_focus/src/core/exception/incorrect_relationship_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/util/date/copy_date_time.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';

class CardSideEntity with EquatableMixin {
  late String? _title;
  late String _content;

  CardSideEntity({
    String? title,
    required String content,
  }) {
    _title = title;
    _content = content;
  }

  String? get title {
    return _title;
  }

  String get content {
    return _content;
  }

  void edit({
    String? title,
    String? content,
  }) {
    _title = title;

    if (content != null) {
      _content = content;
    }
  }

  @override
  List<Object?> get props => [
        title,
        content,
      ];
}

class CardEntity extends Entity<StringIdentifier>
    with EquatableMixin, RemovableEntity {
  late CardSideEntity _front;
  CardSideEntity get front => _front;

  late CardSideEntity _back;
  CardSideEntity get back => _back;

  late DateTime _createdAt;
  DateTime get createdAt => _createdAt;

  late DateTime _updatedAt;
  DateTime get updatedAt => _updatedAt;

  DateTime? _deletedAt;
  DateTime? get deletedAt => _deletedAt;

  IntIdentifier? _categoryId;
  IntIdentifier? get categoryId => _categoryId;

  CategoryEntity? _category;
  CategoryEntity? get category => _category;

  CardEntity({
    super.id,
    required CardSideEntity front,
    required CardSideEntity back,
    IntIdentifier? categoryId,
    CategoryEntity? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    _front = front;
    _back = back;
    _categoryId = categoryId;
    _category = category;

    final isOnlyOneIsProvided = (category == null && categoryId != null) ||
        (category != null && categoryId == null);
    final isBothProvided = category != null && categoryId != null;
    if (isOnlyOneIsProvided) {
      throw const IncorrectRelationshipException(
        data: "Incorrect category relation.",
      );
    }
    if (isBothProvided && category.id != categoryId) {
      throw const IncorrectRelationshipException(
        data: "Incorrect category relation.",
      );
    }

    if (createdAt == null) {
      _createdAt = DateTime.now();
    } else {
      _createdAt = createdAt;
    }

    if (updatedAt == null) {
      _updatedAt = copyDateTime(_createdAt);
    } else {
      _updatedAt = updatedAt;
    }
  }

  void edit({
    CardSideEntity? back,
    CardSideEntity? front,
    IntIdentifier? categoryId,
    CategoryEntity? category,
  }) {
    _updatedAt = DateTime.now();

    if (back is CardSideEntity) {
      _back = back;
    }

    if (front is CardSideEntity) {
      _front = front;
    }

    _categoryId = categoryId;

    _category = category;
  }

  @override
  void remove() {
    _deletedAt = DateTime.now();
    _updatedAt = copyDateTime(_deletedAt!);
  }

  @override
  List<Object?> get props => [
        id,
        _front,
        _back,
        _category,
        _categoryId,
        _createdAt,
        _deletedAt,
        _updatedAt,
      ];
}
