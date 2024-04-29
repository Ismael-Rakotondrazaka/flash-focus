import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/category/sqlite_category.dart';
import 'package:flash_focus/src/domain/category/entity/category.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SQLiteCategoryMapper {
  static CategoryEntity toDomainEntity(SQLiteCategory sqLiteCategory) {
    return CategoryEntity(
      id: IntIdentifier(value: sqLiteCategory.id),
      name: sqLiteCategory.name,
    );
  }

  static SQLiteCategory toSQLiteEntity(CategoryEntity categoryEntity) {
    return SQLiteCategory(
      id: categoryEntity.id.value,
      name: categoryEntity.name,
    );
  }

  static List<CategoryEntity> toDomainEntities(
      List<SQLiteCategory> sqLiteCategories) {
    return sqLiteCategories
        .map((SQLiteCategory sqLiteCategory) => toDomainEntity(sqLiteCategory))
        .toList();
  }
}
