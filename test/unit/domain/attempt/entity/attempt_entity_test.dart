import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("AttemptEntity", () {
    group("constructor", () {
      test("should return a AttemptEntity instance with given properties", () {
        const id = IntIdentifier(value: 1);
        const cardId = StringIdentifier(value: "1");
        const isSuccess = true;
        final createdAt = DateTime.now();
        const deletedAt = null;

        final attemptEntity = AttemptEntity(
          id: id,
          cardId: cardId,
          isSuccess: isSuccess,
          createdAt: createdAt,
          deletedAt: deletedAt,
        );

        expect(attemptEntity, isA<AttemptEntity>());
        expect(attemptEntity.id, id);
        expect(attemptEntity.cardId, cardId);
        expect(attemptEntity.isSuccess, isSuccess);
        expect(attemptEntity.createdAt, createdAt);
        expect(attemptEntity.deletedAt, deletedAt);
      });

      test("should return a AttemptEntity instance with default properties",
          () {
        const cardId = StringIdentifier(value: "1");
        const isSuccess = true;

        final attemptEntity = AttemptEntity(
          cardId: cardId,
          isSuccess: isSuccess,
        );

        expect(attemptEntity, isA<AttemptEntity>());
        expect(attemptEntity.cardId, cardId);
        expect(attemptEntity.isSuccess, isSuccess);
        expect(attemptEntity.createdAt, isA<DateTime>());
        expect(attemptEntity.deletedAt, null);
      });
    });

    group("remove", () {
      test("should return a AttemptEntity instance with deletedAt property",
          () {
        final attemptEntity = AttemptEntity(
          id: const IntIdentifier(value: 1),
          cardId: const StringIdentifier(value: "1"),
          isSuccess: true,
          createdAt: DateTime.now(),
        );

        attemptEntity.remove();

        expect(attemptEntity, isA<AttemptEntity>());
        expect(attemptEntity.deletedAt, isA<DateTime>());
      });
    });
  });
}
