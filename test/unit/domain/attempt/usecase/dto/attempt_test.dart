import 'package:flash_focus/src/domain/attempt/usecase/dto/attempt.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Attempt", () {
    group("constructor", () {
      test("should return a Attempt instance", () {
        const id = 1;
        const cardId = "1";
        const isSuccess = true;
        final createdAt = DateTime.now();
        const deletedAt = null;

        final attempt = Attempt(
          id: id,
          cardId: cardId,
          isSuccess: isSuccess,
          createdAt: createdAt,
          deletedAt: deletedAt,
        );

        expect(attempt, isA<Attempt>());
        expect(attempt.id, id);
        expect(attempt.cardId, cardId);
        expect(attempt.isSuccess, isSuccess);
        expect(attempt.createdAt, createdAt);
        expect(attempt.deletedAt, deletedAt);
      });
    });
  });
}
