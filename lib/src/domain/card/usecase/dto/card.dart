import 'package:equatable/equatable.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class CardSide extends Equatable {
  final String? title;
  final String content;

  const CardSide({
    required this.title,
    required this.content,
  });

  @override
  List<Object?> get props => [
        title,
        content,
      ];
}

@immutable
class Card extends Equatable {
  final String id;
  final CardSide front;
  final CardSide back;
  final int? categoryId;
  final Category? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const Card({
    required this.id,
    required this.front,
    required this.back,
    required this.categoryId,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        front,
        back,
        category,
        categoryId,
        createdAt,
        deletedAt,
        updatedAt,
      ];
}
