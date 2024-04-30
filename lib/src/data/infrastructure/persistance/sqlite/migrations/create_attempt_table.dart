import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/attempt/sqlite_attempt.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/card/sqlite_card.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/util/migration.dart';
import 'package:sqflite/sqflite.dart';

class CreateAttemptTable extends Migration {
  @override
  Future<void> down({
    required Database db,
  }) async {
    String query = """
      DROP TABLE ${SQLiteAttempt.tableName};
    """;

    await db.execute(query);
  }

  @override
  Future<void> up({
    required Database db,
    bool? force,
  }) async {
    String query = """
      CREATE TABLE ${force ?? false ? '' : ' IF NOT EXISTS '} ${SQLiteAttempt.tableName} (
        ${SQLiteAttempt.idColumnName} INTEGER NOT NULL AUTOINCREMENT,
        ${SQLiteAttempt.isSuccessColumnName} INTEGER NOT NULL,
        ${SQLiteAttempt.cardIdColumnName} INTEGER NOT NULL,
        ${SQLiteAttempt.createdAtColumnName} TEXT NOT NULL,
        ${SQLiteAttempt.deletedAtColumnName} TEXT,
        CONSTRAINT attempt_pk PRIMARY KEY (${SQLiteAttempt.idColumnName})
        FOREIGN KEY(${SQLiteAttempt.cardIdColumnName}) REFERENCES ${SQLiteCard.tableName}(${SQLiteCard.idColumnName})
      );
    """;

    await db.execute(query);
  }
}
