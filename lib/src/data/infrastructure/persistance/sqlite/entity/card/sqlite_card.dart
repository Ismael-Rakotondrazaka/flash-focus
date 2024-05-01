import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/category/sqlite_category.dart';
import 'package:flutter/foundation.dart';

@immutable
class SQLiteCard {
  static const String tableName = "card";
  static const String idColumnName = "id";
  static const String categoryIdColumnName = "category_id";
  static const String frontTitleColumnName = "front_title";
  static const String frontContentColumnName = "front_content";
  static const String backTitleColumnName = "back_title";
  static const String backContentColumnName = "back_content";
  static const String createdAtColumnName = "created_at";
  static const String updatedAtColumnName = "updated_at";
  static const String deletedAtColumnName = "deleted_at";

  /* ------------------------------ Related alias ----------------------------- */
  static const String cardAlias = "car";
  static const String categoryAlias = "cat";

  final String id;
  final String? frontTitle;
  final String frontContent;
  final String? backTitle;
  final String backContent;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String? categoryId;
  final SQLiteCategory? category;

  const SQLiteCard({
    required this.id,
    required this.frontTitle,
    required this.frontContent,
    required this.backTitle,
    required this.backContent,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.categoryId,
    required this.category,
  });

  Map<String, Object?> toMap() {
    return {
      idColumnName: id,
      frontTitleColumnName: frontTitle,
      frontContentColumnName: frontContent,
      backTitleColumnName: backTitle,
      backContentColumnName: backContent,
      createdAtColumnName: createdAt,
      updatedAtColumnName: updatedAt,
      deletedAtColumnName: deletedAt,
      categoryIdColumnName: categoryId,
      // Note: category is typically not included in the SQLite table map unless explicitly required
    };
  }

  static SQLiteCard fromMap(Map<String, Object?> map) {
    return SQLiteCard(
      id: map[idColumnName] as String,
      frontTitle: map[frontTitleColumnName] as String?,
      frontContent: map[frontContentColumnName] as String,
      backTitle: map[backTitleColumnName] as String?,
      backContent: map[backContentColumnName] as String,
      createdAt: map[createdAtColumnName] as String,
      updatedAt: map[updatedAtColumnName] as String,
      deletedAt: map[deletedAtColumnName] as String?,
      categoryId: map[categoryIdColumnName] as String?,
      category:
          map['${SQLiteCard.categoryAlias}.${SQLiteCategory.idColumnName}']
                  is int
              ? SQLiteCategory(
                  id: map['${SQLiteCard.categoryAlias}.${SQLiteCategory.idColumnName}']
                      as int,
                  name:
                      map['${SQLiteCard.categoryAlias}.${SQLiteCategory.nameColumnName}']
                          as String,
                )
              : null,
    );
  }
}
