import 'package:flash_focus/src/core/entity/entity.dart';
import 'package:flash_focus/src/core/exception/incorrect_relationship_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CardEntity', () {
    group("parent", () {
      test('should be Entity', () {
        final card = CardEntity(
          id: const StringIdentifier(value: "1"),
          back: CardSideEntity(content: "Back content", title: "Back title"),
          front: CardSideEntity(content: "Front content", title: "Front title"),
          category: CategoryEntity(
            id: const IntIdentifier(value: 1),
            name: 'Category 1',
          ),
        );

        expect(card, isA<Entity>());
      });
    });

    group("constructor", () {
      test("should return an instance of CardEntity with given properties", () {
        const id = StringIdentifier(value: "1");
        final back =
            CardSideEntity(content: "Back content", title: "Back title");
        final front =
            CardSideEntity(content: "Front content", title: "Front title");
        const categoryId = IntIdentifier(value: 1);
        final category = CategoryEntity(
          id: categoryId,
          name: 'Category 1',
        );
        final createdAt = DateTime.now();
        final updatedAt = DateTime.now();
        const deletedAt = null;

        final card = CardEntity(
          id: id,
          back: back,
          front: front,
          categoryId: categoryId,
          category: category,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

        expect(card, isA<CardEntity>());
        expect(card.id, id);
        expect(card.back, back);
        expect(card.front, front);
        expect(card.categoryId, categoryId);
        expect(card.category, category);
        expect(card.createdAt, createdAt);
        expect(card.updatedAt, updatedAt);
        expect(card.deletedAt, deletedAt);
      });

      test(
          "should return an instance of CardEntity where unspecified properties have default values",
          () {
        final card = CardEntity(
          id: const StringIdentifier(value: "1"),
          back: CardSideEntity(content: "Back content"),
          front: CardSideEntity(content: "Front content"),
        );

        expect(card.createdAt, isA<DateTime>());
        expect(card.updatedAt, isA<DateTime>());
        expect(card.deletedAt, null);
        expect(card.categoryId, null);
        expect(card.category, null);
      });

      test(
          "should throw an exception if category relation doesn't match the categoryId",
          () {
        expect(
          () => CardEntity(
            id: const StringIdentifier(value: "1"),
            back: CardSideEntity(content: "Back content"),
            front: CardSideEntity(content: "Front content"),
            categoryId: const IntIdentifier(value: 1),
            category: CategoryEntity(
              id: const IntIdentifier(value: 2),
              name: 'Category 2',
            ),
          ),
          throwsA(isA<IncorrectRelationshipException>()),
        );
      });

      test(
          "should throw an exception if category is null and categoryId is not",
          () {
        expect(
          () => CardEntity(
            id: const StringIdentifier(value: "1"),
            back: CardSideEntity(content: "Back content"),
            front: CardSideEntity(content: "Front content"),
            categoryId: const IntIdentifier(value: 1),
            category: null,
          ),
          throwsA(isA<IncorrectRelationshipException>()),
        );
      });

      test(
          "should throw an exception if categoryId is null and category is not",
          () {
        expect(
          () => CardEntity(
            id: const StringIdentifier(value: "1"),
            back: CardSideEntity(content: "Back content"),
            front: CardSideEntity(content: "Front content"),
            categoryId: null,
            category: CategoryEntity(
              id: const IntIdentifier(value: 1),
              name: 'Category 1',
            ),
          ),
          throwsA(isA<IncorrectRelationshipException>()),
        );
      });
    });

    group("edit", () {
      test('should update properties with given new values', () {
        final card = CardEntity(
          id: const StringIdentifier(value: "1"),
          back: CardSideEntity(content: "Back content", title: "Back title"),
          front: CardSideEntity(content: "Front content", title: "Front title"),
          category: CategoryEntity(
            id: const IntIdentifier(value: 1),
            name: 'Category 1',
          ),
        );

        // New
        const categoryId = IntIdentifier(value: 5);
        final category = CategoryEntity(
          id: const IntIdentifier(value: 5),
          name: "Category 5",
        );
        final back = CardSideEntity(
          content: "New back content",
          title: "New back title",
        );
        final front = CardSideEntity(
          content: "New front content",
          title: "New front title",
        );

        card.edit(
          categoryId: categoryId,
          category: category,
          back: back,
          front: front,
        );

        expect(card.categoryId, categoryId);
        expect(card.category, category);
        expect(card.back, back);
        expect(card.front, front);

        // updatedAt should be updated
        expect(card.updatedAt, isNot(card.createdAt));
      });
    });

    group("remove", () {
      test("should marked as deleted", () {
        final card = CardEntity(
          id: const StringIdentifier(value: "1"),
          back: CardSideEntity(content: "Back content", title: "Back title"),
          front: CardSideEntity(content: "Front content", title: "Front title"),
          category: CategoryEntity(
            id: const IntIdentifier(value: 1),
            name: 'Category 1',
          ),
        );

        card.remove();

        expect(card.deletedAt, isA<DateTime>());
      });
    });
  });
}
