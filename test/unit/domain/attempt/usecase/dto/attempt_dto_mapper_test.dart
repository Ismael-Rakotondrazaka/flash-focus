import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flash_focus/src/domain/attempt/usecase/dto/attempt.dart';
import 'package:flash_focus/src/domain/attempt/usecase/dto/attempt_dto_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("AttemptDTOMapper", () {
    group("toDTO", () {
      test("should return a AttemptDTO instance", () {
        final attemptEntity = AttemptEntity(
          id: const IntIdentifier(value: 1),
          cardId: const StringIdentifier(value: "1"),
          isSuccess: true,
          createdAt: DateTime.now(),
        );

        final attemptDTO = AttemptDTOMapper.toDTO(attemptEntity);

        expect(attemptDTO, isA<Attempt>());
        expect(attemptDTO.id, attemptEntity.id.value);
        expect(attemptDTO.cardId, attemptEntity.cardId.value);
        expect(attemptDTO.isSuccess, attemptEntity.isSuccess);
        expect(attemptDTO.createdAt, attemptEntity.createdAt);
        expect(attemptDTO.deletedAt, attemptEntity.deletedAt);
      });

      test("should return a list of AttemptDTO instance", () {
        final attempts = [
          AttemptEntity(
            id: const IntIdentifier(value: 1),
            cardId: const StringIdentifier(value: "1"),
            isSuccess: true,
            createdAt: DateTime.now(),
          ),
          AttemptEntity(
            id: const IntIdentifier(value: 2),
            cardId: const StringIdentifier(value: "2"),
            isSuccess: false,
            createdAt: DateTime.now(),
          ),
        ];

        final attemptsDTO = AttemptDTOMapper.toDTOList(attempts);

        expect(attemptsDTO, isA<List<Attempt>>());
        expect(attemptsDTO.length, 2);
        expect(attemptsDTO[0].id, attempts[0].id.value);
        expect(attemptsDTO[0].cardId, attempts[0].cardId.value);
        expect(attemptsDTO[0].isSuccess, attempts[0].isSuccess);
        expect(attemptsDTO[0].createdAt, attempts[0].createdAt);
        expect(attemptsDTO[0].deletedAt, attempts[0].deletedAt);
        expect(attemptsDTO[1].id, attempts[1].id.value);
        expect(attemptsDTO[1].cardId, attempts[1].cardId.value);
        expect(attemptsDTO[1].isSuccess, attempts[1].isSuccess);
        expect(attemptsDTO[1].createdAt, attempts[1].createdAt);
        expect(attemptsDTO[1].deletedAt, attempts[1].deletedAt);
      });
    });
  });
}
