import 'package:flutter/foundation.dart';

@immutable
class SQLiteCategory {
  static const String tableName = "category";
  static const String idColumnName = "id";
  static const String nameColumnName = "name";

  final int id;
  final String name;

  const SQLiteCategory({
    required this.id,
    required this.name,
  });

  Map<String, Object?> toMap() {
    return {
      idColumnName: id,
      nameColumnName: name,
    };
  }

  SQLiteCategory.fromMap(Map<String, Object?> map)
      : id = map[idColumnName] as int,
        name = map[nameColumnName] as String;
}
