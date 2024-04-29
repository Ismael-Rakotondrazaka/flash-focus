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
      isSuccess: SQLiteAttemptIsSuccessMapper.toDomainEntity(sqLiteAttempt.isSuccess),
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
      isSuccess: SQLiteAttemptIsSuccessMapper.toSQLiteEntity(attemptEntity.isSuccess),
      createdAt: attemptEntity.createdAt.toIso8601String(),
      deletedAt: attemptEntity.deletedAt?.toIso8601String(),
    );
  }

  static List<AttemptEntity> toDomainEntities(
      List<SQLiteAttempt> sqLiteAttempts) {
    return sqLiteAttempts
        .map(
          (SQLiteAttempt sqLiteAttempt) => toDomainEntity(sqLiteAttempt),
        )
        .toList();
  }
}

abstract class SQLiteAttemptIsSuccessMapper {
  static bool toDomainEntity(int raw) {
    return raw == 1;
  }

  static int toSQLiteEntity(bool isSuccess) {
    return isSuccess ? 1 : 0;
  }
}
