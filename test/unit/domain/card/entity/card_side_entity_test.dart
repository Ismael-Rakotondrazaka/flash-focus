import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CardSideEntity", () {
    group("constructor", () {
      test("should return an instance of CardSideEntity with given properties",
          () {
        final cardSide = CardSideEntity(
          content: "Card content",
          title: "Card title",
        );

        expect(cardSide, isA<CardSideEntity>());
        expect(cardSide.content, 'Card content');
        expect(cardSide.title, 'Card title');
      });

      test("should return an instance of CardSideEntity with default properties for non nullable fields",
          () {
        final cardSide = CardSideEntity(content: "content");

        expect(cardSide, isA<CardSideEntity>());
        expect(cardSide.content, 'content');
        expect(cardSide.title, null);
      });
    });

    group('comparison', () {
      test('should return true when comparing two identical instances', () {
        final cardSide1 = CardSideEntity(
          content: "Card content",
          title: "Card title",
        );
        final cardSide2 = CardSideEntity(
          content: "Card content",
          title: "Card title",
        );

        expect(cardSide1, cardSide2);
      });

      test('should return false when comparing two different instances', () {
        final cardSide1 = CardSideEntity(
          content: "Card content",
          title: "Card title",
        );
        final cardSide2 = CardSideEntity(
          content: "Card content",
          title: "Card title 2",
        );

        expect(cardSide1, isNot(cardSide2));
      });
    });

    group('edit', () {
      test('should update properties with the new title and content', () {
        final cardSide = CardSideEntity(
          content: "Card content",
          title: "Card title",
        );

        cardSide.edit(
          content: "New card content",
          title: null,
        );

        expect(cardSide.content, "New card content");
        expect(cardSide.title, null);
      });
    });
  });
}
