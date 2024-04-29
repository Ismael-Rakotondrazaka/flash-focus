import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flash_focus/src/domain/attempt/usecase/dto/attempt.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AttemptDTOMapper {
  static Attempt toDTO(AttemptEntity attempt) {
    return Attempt(
      id: attempt.id.value,
      cardId: attempt.cardId.value,
      isSuccess: attempt.isSuccess,
      createdAt: attempt.createdAt,
      deletedAt: attempt.deletedAt,
    );
  }

  static List<Attempt> toDTOList(List<AttemptEntity> attempts) => attempts
      .map(
        (attempt) => toDTO(attempt),
      )
      .toList();
}
