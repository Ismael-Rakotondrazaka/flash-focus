import 'package:flutter/foundation.dart';

@immutable
class SQLiteAttempt {
  static const String tableName = "attempt";
  static const String idColumnName = "id";
  static const String cardIdColumnName = "card_id";
  static const String isSuccessColumnName = "is_success";
  static const String createdAtColumnName = "created_at";
  static const String deletedAtColumnName = "deleted_at";

  final int id;
  final String cardId;
  final int isSuccess;
  final String createdAt;
  final String? deletedAt;

  const SQLiteAttempt({
    required this.id,
    required this.cardId,
    required this.isSuccess,
    required this.createdAt,
    required this.deletedAt,
  });

  Map<String, Object?> toMap() {
    return {
      idColumnName: id,
      cardIdColumnName: cardId,
      isSuccessColumnName: isSuccess,
      createdAtColumnName: createdAt,
      deletedAtColumnName: deletedAt,
    };
  }

  static SQLiteAttempt fromMap(Map<String, Object?> map) {
    return SQLiteAttempt(
      id: map[idColumnName] as int,
      cardId: map[cardIdColumnName] as String,
      isSuccess: map[isSuccessColumnName] as int,
      createdAt: map[createdAtColumnName] as String,
      deletedAt: map[deletedAtColumnName] as String?,
    );
  }
}
