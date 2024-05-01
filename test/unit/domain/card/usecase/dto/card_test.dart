import 'package:flash_focus/src/domain/card/usecase/dto/card.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Card", () {
    group("constructor", () {
      test("should return a Card instance", () {
        const id = "1";
        const back = CardSide(content: "Back content", title: "Back title");
        const front = CardSide(content: "Front content", title: "Front title");
        const categoryId = 1;
        const category = Category(
          id: 1,
          name: 'Category 1',
        );
        final createdAt = DateTime.now();
        final updatedAt = DateTime.now();
        const deletedAt = null;

        final card = Card(
          id: id,
          back: back,
          front: front,
          categoryId: categoryId,
          category: category,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

        expect(card, isA<Card>());
        expect(card.id, id);
        expect(card.back, back);
        expect(card.front, front);
        expect(card.categoryId, categoryId);
        expect(card.category, category);
        expect(card.createdAt, createdAt);
        expect(card.updatedAt, updatedAt);
        expect(card.deletedAt, deletedAt);
      });
    });
  });
}
