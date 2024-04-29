import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/card/sqlite_card.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/card/sqlite_card_mapper.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/category/sqlite_category.dart';
import 'package:flash_focus/src/domain/card/entity/card.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteCardRepository implements CardRepositoryPort {
  final Uuid _uuid;
  final Database _db;

  const SQLiteCardRepository({
    required Uuid uuid,
    required Database db,
  })  : _uuid = uuid,
        _db = db;

  @override
  Future<StringIdentifier> addCard({
    required CardEntity card,
  }) async {
    try {
      StringIdentifier id = StringIdentifier(value: _uuid.v4());
      card.id = id;

      SQLiteCard sqLiteCard = SQLiteCardMapper.toSQLiteEntity(card);

      await _db.insert(SQLiteCard.tableName, sqLiteCard.toMap());

      return id;
    } catch (e) {
      // TODO
      rethrow;
    }
  }

  static const String selectProperties = """
    ${SQLiteCard.cardAlias}.*,
    ${SQLiteCard.categoryAlias}.${SQLiteCategory.idColumnName} AS '${SQLiteCard.categoryAlias}.${SQLiteCategory.idColumnName}',
    ${SQLiteCard.categoryAlias}.${SQLiteCategory.nameColumnName} AS '${SQLiteCard.categoryAlias}.${SQLiteCategory.nameColumnName}'
  """;

  static const String baseQuery = """
    SELECT
      $selectProperties
    FROM ${SQLiteCard.tableName} ${SQLiteCard.cardAlias}
    LEFT JOIN ${SQLiteCategory.tableName} ${SQLiteCard.categoryAlias}
    ON
      ${SQLiteCard.cardAlias}.${SQLiteCard.categoryIdColumnName}
      =
      ${SQLiteCard.categoryAlias}.${SQLiteCategory.idColumnName}
    """;

  @override
  Future<CardEntity> findCard({
    StringIdentifier? id,
    RepositoryFindOptions? option,
  }) async {
    List<String> wheres = [];
    List<Object?> whereArgs = [];

    if (id is StringIdentifier) {
      wheres.add('${SQLiteCard.idColumnName} = ?');
      whereArgs.add(id.value);
    }

    if (!(option is RepositoryFindOptions &&
        (option.includeRemoved ?? false))) {
      wheres.add('${SQLiteCard.deletedAtColumnName} = ?');
      whereArgs.add(null);
    }

    String whereQuery = "";
    if (wheres.isNotEmpty) {
      whereQuery += " WHERE ";

      if (wheres.length == 1) {
        whereQuery += wheres[0];
      } else {
        whereQuery += '(${wheres.join(' AND ')})';
      }
    }

    String query = "$baseQuery $whereQuery LIMIT 1;";

    var results = await _db.rawQuery(query, whereArgs);

    if (results.isEmpty) {
      throw UnimplementedError();
    }

    SQLiteCard sqLiteCard = SQLiteCard.fromMap(results.first);
    CardEntity card = SQLiteCardMapper.toDomainEntity(sqLiteCard);

    return card;
  }

  @override
  Future<List<CardEntity>> findCards({
    String? front,
    String? back,
    RepositoryFindOptions? option,
  }) async {
    List<String> wheres = [];
    List<Object?> whereArgs = [];

    if (front is String && back is String) {
      wheres.add("""
        (
          ${SQLiteCard.frontTitleColumnName} LIKE ?
          OR
          ${SQLiteCard.frontContentColumnName} LIKE ?
          OR
          ${SQLiteCard.backTitleColumnName} LIKE ?
          OR
          ${SQLiteCard.backContentColumnName} LIKE ?
        )
      """);

      whereArgs.addAll([
        front,
        front,
        back,
        back,
      ]);
    } else if (front is String) {
      wheres.add("""
        (
          ${SQLiteCard.frontTitleColumnName} LIKE ?
          OR
          ${SQLiteCard.frontContentColumnName} LIKE ?
        )
      """);

      whereArgs.addAll([
        front,
        front,
      ]);
    } else if (front is String && back is String) {
      wheres.add("""
        (
          ${SQLiteCard.backTitleColumnName} LIKE ?
          OR
          ${SQLiteCard.backContentColumnName} LIKE ?
        )
      """);

      whereArgs.addAll([
        back,
        back,
      ]);
    }

    if (!(option is RepositoryFindOptions &&
        (option.includeRemoved ?? false))) {
      wheres.add('${SQLiteCard.backTitleColumnName} = ?');
      whereArgs.add(null);
    }

    String whereQuery = "";
    if (wheres.isNotEmpty) {
      whereQuery += " WHERE ";

      if (wheres.length == 1) {
        whereQuery += ' ${wheres.first}';
      } else {
        whereQuery += ' (${wheres.join(' AND ')})';
      }
    }

    String query = "$baseQuery $whereQuery;";

    var rawList = await _db.rawQuery(query, whereArgs);

    List<CardEntity> result = rawList
        .map((rawElement) =>
            SQLiteCardMapper.toDomainEntity(SQLiteCard.fromMap(rawElement)))
        .toList();

    return result;
  }

  @override
  Future<void> removeCard({
    required CardEntity card,
    RepositoryRemoveOptions? option,
  }) async {
    if (!(option?.disableSoftDeleting ?? false)) {
      await updateCard(card: card);
    } else {
      await _db.delete(
        SQLiteCard.tableName,
        where: '${SQLiteCard.idColumnName} = ?',
        whereArgs: [
          card.id.value,
        ],
      );
    }
  }

  @override
  Future<void> updateCard({
    required CardEntity card,
  }) async {
    SQLiteCard sqLiteCard = SQLiteCardMapper.toSQLiteEntity(card);

    await _db.update(
      SQLiteCard.tableName,
      sqLiteCard.toMap(),
      where: '${SQLiteCard.idColumnName} = ?',
      whereArgs: [sqLiteCard.id],
    );
  }

  @override
  Future<void> removeCards({
    required List<CardEntity> cards,
    RepositoryRemoveOptions? option,
  }) async {
    if (option is RepositoryRemoveOptions &&
        (option.disableSoftDeleting ?? false)) {
      await _db.delete(
        SQLiteCard.tableName,
        where: '${SQLiteCard.idColumnName} in ?',
        whereArgs: [
          cards.map((card) => card.id.value),
        ],
      );
    } else {
      await Future.wait(cards.map((card) => updateCard(card: card)));
    }
  }

  @override
  Future<void> updateCards({
    List<StringIdentifier>? ids,
    DateTime? deletedAt,
    RepositoryFindOptions? option,
  }) {
    // TODO: implement findCards
    throw UnimplementedError();
  }
}
