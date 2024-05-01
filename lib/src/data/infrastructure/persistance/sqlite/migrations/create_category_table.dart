import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/category/sqlite_category.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/util/migration.dart';
import 'package:sqflite/sqflite.dart';

class CreateCategoryTable extends Migration {
  @override
  Future<void> down({
    required Database db,
  }) async {
    String query = """
      DROP TABLE ${SQLiteCategory.tableName};
    """;

    await db.execute(query);
  }

  @override
  Future<void> up({
    required Database db,
    bool? force,
  }) async {
    String query = """
      CREATE TABLE ${force ?? false ? '' : ' IF NOT EXISTS '} ${SQLiteCategory.tableName} (
        ${SQLiteCategory.idColumnName} INTEGER NOT NULL AUTOINCREMENT,
        ${SQLiteCategory.nameColumnName} TEXT NOT NULL,
        CONSTRAINT category_pk PRIMARY KEY (id)
      );
    """;

    await db.execute(query);
  }
}
