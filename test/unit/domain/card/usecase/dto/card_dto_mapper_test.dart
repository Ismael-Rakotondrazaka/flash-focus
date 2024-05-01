import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/usecase/dto/card.dart';
import 'package:flash_focus/src/domain/card/usecase/dto/card_dto_mapper.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CardDTOMapper", () {
    test("should return the card DTO", () {
      final card = CardEntity(
        id: const StringIdentifier(value: "1"),
        back: CardSideEntity(
          content: "Back content",
          title: "Back title",
        ),
        front: CardSideEntity(
          content: "Front content",
          title: "Front title",
        ),
        categoryId: const IntIdentifier(value: 1),
        category: CategoryEntity(
          id: const IntIdentifier(value: 1),
          name: 'Category 1',
        ),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
      );
      final cardDTO = CardDTOMapper.toDTO(card);

      expect(cardDTO, isA<Card>());
      expect(cardDTO.id, "1");
      expect(cardDTO.back.content, "Back content");
      expect(cardDTO.back.title, "Back title");
      expect(cardDTO.front.content, "Front content");
      expect(cardDTO.front.title, "Front title");
      expect(cardDTO.categoryId, 1);
      expect(cardDTO.category!.id, 1);
      expect(cardDTO.category!.name, "Category 1");
      expect(cardDTO.createdAt, card.createdAt);
      expect(cardDTO.updatedAt, card.updatedAt);
      expect(cardDTO.deletedAt, null);
    });

    test("should return the list of card DTO", () {
      final cards = [
        CardEntity(
          id: const StringIdentifier(value: "1"),
          back: CardSideEntity(
            content: "Back content",
            title: "Back title",
          ),
          front: CardSideEntity(
            content: "Front content",
            title: "Front title",
          ),
          categoryId: const IntIdentifier(value: 1),
          category: CategoryEntity(
            id: const IntIdentifier(value: 1),
            name: 'Category 1',
          ),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
        ),
        CardEntity(
          id: const StringIdentifier(value: "2"),
          back: CardSideEntity(
            content: "Back content",
            title: "Back title",
          ),
          front: CardSideEntity(
            content: "Front content",
            title: "Front title",
          ),
          categoryId: const IntIdentifier(value: 2),
          category: CategoryEntity(
            id: const IntIdentifier(value: 2),
            name: 'Category 2',
          ),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
        ),
      ];
      final cardsDTO = CardDTOMapper.toDTOList(cards);
      expect(cardsDTO.length, 2);

      final isAllInstanceOfCard =
          // ignore: unnecessary_type_check
          cardsDTO.every((card) => card is Card);
      expect(isAllInstanceOfCard, true);

      expect(cardsDTO[0].id, "1");
      expect(cardsDTO[0].back.content, "Back content");
      expect(cardsDTO[0].back.title, "Back title");
      expect(cardsDTO[0].front.content, "Front content");
      expect(cardsDTO[0].front.title, "Front title");
      expect(cardsDTO[0].categoryId, 1);
      expect(cardsDTO[0].category!.id, 1);
      expect(cardsDTO[0].category!.name, "Category 1");
      expect(cardsDTO[0].createdAt, cards[0].createdAt);
      expect(cardsDTO[0].updatedAt, cards[0].updatedAt);
      expect(cardsDTO[0].deletedAt, null);

      expect(cardsDTO[1].id, "2");
      expect(cardsDTO[1].back.content, "Back content");
      expect(cardsDTO[1].back.title, "Back title");
      expect(cardsDTO[1].front.content, "Front content");
      expect(cardsDTO[1].front.title, "Front title");
      expect(cardsDTO[1].categoryId, 2);
      expect(cardsDTO[1].category!.id, 2);
      expect(cardsDTO[1].category!.name, "Category 2");
      expect(cardsDTO[1].createdAt, cards[1].createdAt);
      expect(cardsDTO[1].updatedAt, cards[1].updatedAt);
      expect(cardsDTO[1].deletedAt, null);
    });
  });
}
