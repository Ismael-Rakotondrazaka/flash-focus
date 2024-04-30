import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/card/sqlite_card.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/category/sqlite_category.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/util/migration.dart';
import 'package:sqflite/sqflite.dart';

class CreateCardTable extends Migration {
  @override
  Future<void> down({
    required Database db,
  }) async {
    String query = """
      DROP TABLE ${SQLiteCard.tableName};
    """;

    await db.execute(query);
  }

  @override
  Future<void> up({
    required Database db,
    bool? force,
  }) async {
    String query = """
      CREATE TABLE ${force ?? false ? '' : ' IF NOT EXISTS '} ${SQLiteCard.tableName} (
        ${SQLiteCard.idColumnName} TEXT NOT NULL,
        ${SQLiteCard.frontContentColumnName} TEXT NOT NULL,
        ${SQLiteCard.frontTitleColumnName} TEXT,
        ${SQLiteCard.backContentColumnName} TEXT NOT NULL,
        ${SQLiteCard.backTitleColumnName} TEXT,
        ${SQLiteCard.createdAtColumnName} TEXT NOT NULL,
        ${SQLiteCard.updatedAtColumnName} TEXT NOT NULL,
        ${SQLiteCard.deletedAtColumnName} TEXT,
        ${SQLiteCard.categoryIdColumnName} INTEGER,
        CONSTRAINT card_pk PRIMARY KEY (${SQLiteCard.idColumnName})
        FOREIGN KEY(${SQLiteCard.categoryIdColumnName}) REFERENCES ${SQLiteCategory.tableName}(${SQLiteCategory.idColumnName})
      );
    """;

    await db.execute(query);
  }
}
