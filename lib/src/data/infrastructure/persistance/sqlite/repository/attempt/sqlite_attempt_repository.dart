import 'package:flash_focus/src/core/exception/not_found_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/attempt/sqlite_attempt.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/attempt/sqlite_attempt_mapper.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flash_focus/src/domain/attempt/port/persistance/attempt_repository_port.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteAttemptRepository implements AttemptRepositoryPort {
  final Database _db;

  const SQLiteAttemptRepository({
    required Database db,
  }) : _db = db;

  static const String selectProperties = "*";

  static const String baseQuery = """
    SELECT
      $selectProperties
    FROM ${SQLiteAttempt.tableName}
  """;

  @override
  Future<IntIdentifier> addAttempt({
    required AttemptEntity attempt,
  }) async {
    SQLiteAttempt sqLiteCard = SQLiteAttemptMapper.toSQLiteEntity(attempt);

    int id = await _db.insert(SQLiteAttempt.tableName, sqLiteCard.toMap());

    return IntIdentifier(value: id);
  }

  @override
  Future<AttemptEntity> findAttempt({
    IntIdentifier? id,
    RepositoryFindOptions? option,
  }) async {
    List<String> wheres = [];
    List<Object?> whereArgs = [];

    if (id is IntIdentifier) {
      wheres.add('${SQLiteAttempt.idColumnName} = ?');
      whereArgs.add(id.value);
    }

    if (!(option is RepositoryFindOptions &&
        (option.includeRemoved ?? false))) {
      wheres.add('${SQLiteAttempt.deletedAtColumnName} = ?');
      whereArgs.add(null);
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
        message: "The attempt is not found.",
        description: "May be it doesn't exist or already deleted.",
      );
    }

    SQLiteAttempt sqLiteAttempt = SQLiteAttempt.fromMap(results.first);
    AttemptEntity attempt = SQLiteAttemptMapper.toDomainEntity(sqLiteAttempt);

    return attempt;
  }

  @override
  Future<List<AttemptEntity>> findAttempts({
    List<IntIdentifier>? attemptIds,
    StringIdentifier? cardId,
    bool? isSuccess,
    DateTime? createdAt,
    RepositoryFindOptions? option,
  }) async {
    List<String> wheres = [];
    List<Object?> whereArgs = [];

    if (attemptIds is List<IntIdentifier>) {
      wheres.add('${SQLiteAttempt.idColumnName} in ?');
      whereArgs.add(
        attemptIds.map((attemptId) => attemptId.value),
      );
    }

    if (cardId is StringIdentifier) {
      wheres.add('${SQLiteAttempt.cardIdColumnName} = ?');
      whereArgs.add(cardId.value);
    }

    if (isSuccess is bool) {
      wheres.add('${SQLiteAttempt.isSuccessColumnName} = ?');

      int sqLiteResult = SQLiteAttemptIsSuccessMapper.toSQLiteEntity(isSuccess);
      whereArgs.add(sqLiteResult);
    }

    if (createdAt is DateTime) {
      wheres.add('(${SQLiteAttempt.createdAtColumnName} = ?)');
      String targetDate = createdAt.toIso8601String().split("T").first;
      whereArgs.add(targetDate);
    }

    if (!(option is RepositoryFindOptions &&
        (option.includeRemoved ?? false))) {
      wheres.add('${SQLiteAttempt.deletedAtColumnName} = ?');
      whereArgs.add(null);
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

    String query = "$baseQuery $whereQuery;";

    var raws = await _db.rawQuery(query, whereArgs);

    List<AttemptEntity> results = raws
        .map(
          (raw) => SQLiteAttemptMapper.toDomainEntity(
            SQLiteAttempt.fromMap(raw),
          ),
        )
        .toList();

    return results;
  }

  Future<void> updateAttempt({
    required AttemptEntity attempt,
  }) async {
    SQLiteAttempt sqLiteCard = SQLiteAttemptMapper.toSQLiteEntity(attempt);

    await _db.update(
      SQLiteAttempt.tableName,
      sqLiteCard.toMap(),
      where: '${SQLiteAttempt.idColumnName} = ?',
      whereArgs: [sqLiteCard.id],
    );
  }

  @override
  Future<void> removeAttempt({
    required AttemptEntity attempt,
    RepositoryRemoveOptions? option,
  }) async {
    if (option is RepositoryRemoveOptions &&
        (option.disableSoftDeleting ?? false)) {
      await _db.delete(
        SQLiteAttempt.tableName,
        where: '${SQLiteAttempt.idColumnName} = ?',
        whereArgs: [
          attempt.id.value,
        ],
      );
    } else {
      updateAttempt(attempt: attempt);
    }
  }

  @override
  Future<void> removeAttempts({
    required List<AttemptEntity> attempts,
    RepositoryRemoveOptions? option,
  }) async {
    if (option is RepositoryRemoveOptions &&
        (option.disableSoftDeleting ?? false)) {
      await _db.delete(
        SQLiteAttempt.tableName,
        where: '${SQLiteAttempt.idColumnName} in ?',
        whereArgs: [
          attempts.map((attempt) => attempt.id.value),
        ],
      );
    } else {
      await Future.wait(
        attempts.map(
          (attempt) => updateAttempt(attempt: attempt),
        ),
      );
    }
  }

  @override
  Future<void> updateAttempts({
    List<IntIdentifier>? ids,
    DateTime? deletedAt,
    RepositoryFindOptions? option,
  }) {
    // TODO: implement updateAttempts
    throw UnimplementedError();
  }
}
