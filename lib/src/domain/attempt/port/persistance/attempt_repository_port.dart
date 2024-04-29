import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt.dart';

abstract class AttemptRepositoryPort {
  Future<List<AttemptEntity>> findAttempts({
    StringIdentifier? cardId,
    AttemptResult? result,
    DateTime? createdAt,
    RepositoryFindOptions? option,
  });

  Future<AttemptEntity> findAttempt({
    IntIdentifier? id,
    RepositoryFindOptions? option,
  });

  Future<IntIdentifier> addAttempt({
    required AttemptEntity attempt,
  });

  Future<void> updateAttempts({
    List<IntIdentifier>? ids,
    DateTime? deletedAt,
    RepositoryFindOptions? option,
  });

  Future<void> removeAttempt({
    required AttemptEntity attempt,
    RepositoryRemoveOptions? option,
  });

  Future<void> removeAttempts({
    required List<AttemptEntity> attempts,
    RepositoryRemoveOptions? option,
  });
}
