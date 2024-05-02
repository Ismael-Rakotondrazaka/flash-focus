import 'package:flash_focus/src/core/exception/not_found_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/category/sqlite_category.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/category/sqlite_category_mapper.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/port/persistance/category_repository_port.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteCategoryRepository implements CategoryRepositoryPort {
  final Database _db;

  const SQLiteCategoryRepository({
    required Database db,
  }) : _db = db;

  static const String selectProperties = "*";

  static const String baseQuery = """
    SELECT
      $selectProperties
    FROM ${SQLiteCategory.tableName}
  """;

  @override
  Future<IntIdentifier> addCategory({
    required CategoryEntity category,
  }) async {
    SQLiteCategory sqLiteCard = SQLiteCategoryMapper.toSQLiteEntity(category);

    int id = await _db.insert(SQLiteCategory.tableName, sqLiteCard.toMap());

    return IntIdentifier(value: id);
  }

  @override
  Future<List<CategoryEntity>> findCategories({
    List<IntIdentifier>? categoryIds,
    String? name,
    RepositoryFindOptions? option,
  }) async {
    List<String> wheres = [];
    List<Object?> whereArgs = [];

    if (categoryIds is List<IntIdentifier>) {
      wheres.add('${SQLiteCategory.idColumnName} in ?');
      whereArgs.add(
        categoryIds.map((attemptId) => attemptId.value),
      );
    }

    if (name is String) {
      wheres.add("${SQLiteCategory.nameColumnName} LIKE ?");

      whereArgs.add(name);
    }

    String whereQuery = "";
    if (wheres.isNotEmpty) {
      whereQuery += " WHERE ";

      if (wheres.length == 1) {
        whereQuery += ' ${wheres.first}';
      } else {
        whereQuery += '(${wheres.join(' AND ')})';
      }
    }

    String query = "$baseQuery $whereQuery;";

    var rawList = await _db.rawQuery(query, whereArgs);

    List<CategoryEntity> result = rawList
        .map((rawElement) => SQLiteCategoryMapper.toDomainEntity(
            SQLiteCategory.fromMap(rawElement)))
        .toList();

    return result;
  }

  @override
  Future<CategoryEntity> findCategory({
    IntIdentifier? id,
    RepositoryFindOptions? option,
  }) async {
    List<String> wheres = [];
    List<Object?> whereArgs = [];

    if (id is IntIdentifier) {
      wheres.add('${SQLiteCategory.idColumnName} = ?');
      whereArgs.add(id.value);
    }

    String whereQuery = "";
    if (wheres.isNotEmpty) {
      whereQuery += " WHERE ";

      if (wheres.length == 1) {
        whereQuery += wheres.first;
      } else {
        whereQuery += '(${wheres.join(' AND ')})';
      }
    }

    String query = "$baseQuery $whereQuery LIMIT 1;";

    var results = await _db.rawQuery(query, whereArgs);

    if (results.isEmpty) {
      throw const NotFoundException(
        message: "The category is not found.",
        description: "It doesn't exist or already deleted.",
      );
    }

    SQLiteCategory sqLiteCategory = SQLiteCategory.fromMap(results.first);
    CategoryEntity category =
        SQLiteCategoryMapper.toDomainEntity(sqLiteCategory);

    return category;
  }

  @override
  Future<void> removeCategory({
    required CategoryEntity category,
    RepositoryRemoveOptions? option,
  }) async {
    await _db.delete(
      SQLiteCategory.tableName,
      where: '${SQLiteCategory.idColumnName} = ?',
      whereArgs: [
        category.id.value,
      ],
    );
  }

  @override
  Future<void> removeCategories({
    required List<CategoryEntity> categories,
    RepositoryRemoveOptions? option,
  }) async {
    await _db.delete(
      SQLiteCategory.tableName,
      where: '${SQLiteCategory.idColumnName} in ?',
      whereArgs: [
        categories.map((category) => category.id),
      ],
    );
  }

  @override
  Future<void> updateCategory({
    required CategoryEntity category,
  }) async {
    SQLiteCategory sqLiteCategory =
        SQLiteCategoryMapper.toSQLiteEntity(category);

    await _db.update(
      SQLiteCategory.tableName,
      sqLiteCategory.toMap(),
      where: '${SQLiteCategory.idColumnName} = ?',
      whereArgs: [sqLiteCategory.id],
    );
  }
}
