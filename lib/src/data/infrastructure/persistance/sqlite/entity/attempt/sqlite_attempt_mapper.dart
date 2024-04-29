import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/attempt/sqlite_attempt.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SQLiteAttemptMapper {
  static AttemptEntity toDomainEntity(SQLiteAttempt sqLiteAttempt) {
    return AttemptEntity(
      id: IntIdentifier(value: sqLiteAttempt.id),
      cardId: StringIdentifier(value: sqLiteAttempt.cardId),
      result: SQLiteAttemptResultMapper.toDomainEntity(sqLiteAttempt.result),
      createdAt: DateTime.parse(sqLiteAttempt.createdAt),
      deletedAt: sqLiteAttempt.deletedAt != null
          ? DateTime.parse(sqLiteAttempt.deletedAt!)
          : null,
    );
  }

  static SQLiteAttempt toSQLiteEntity(AttemptEntity attemptEntity) {
    return SQLiteAttempt(
      id: attemptEntity.id.value,
      cardId: attemptEntity.cardId.value,
      result: SQLiteAttemptResultMapper.toSQLiteEntity(attemptEntity.result),
      createdAt: attemptEntity.createdAt.toIso8601String(),
      deletedAt: attemptEntity.deletedAt?.toIso8601String(),
    );
  }

  static List<AttemptEntity> toDomainEntities(
      List<SQLiteAttempt> sqLiteAttempts) {
    return sqLiteAttempts
        .map((SQLiteAttempt sqLiteAttempt) => toDomainEntity(sqLiteAttempt))
        .toList();
  }
}

abstract class SQLiteAttemptResultMapper {
  static final Map<String, AttemptResult> _map = {
    "success": AttemptResult.success,
    "failure": AttemptResult.failure,
  };

  static AttemptResult toDomainEntity(String raw) {
    final result = _map[raw];

    if (result == null) {
      // TODO create custom error
      throw UnimplementedError();
    }

    return result;
  }

  static String toSQLiteEntity(AttemptResult result) {
    // Reverse map to find the key that matches the given AttemptResult
    for (var entry in _map.entries) {
      if (entry.value == result) {
        return entry.key;
      }
    }

    // TODO create custom error
    throw UnimplementedError("Invalid attempt result: $result");
  }
}
