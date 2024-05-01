import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/usecase/dto/card.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category_dto_mapper.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class CardSideDTOMapper {
  static CardSide toDTO(CardSideEntity cardSide) {
    return CardSide(
      title: cardSide.title,
      content: cardSide.content,
    );
  }
}

@immutable
abstract class CardDTOMapper {
  static Card toDTO(CardEntity attempt) {
    return Card(
      id: attempt.id.value,
      front: CardSideDTOMapper.toDTO(attempt.front),
      back: CardSideDTOMapper.toDTO(attempt.back),
      categoryId: attempt.categoryId?.value,
      category: attempt.category is CategoryEntity
          ? CategoryDTOMapper.toDTO(attempt.category!)
          : null,
      createdAt: attempt.createdAt,
      updatedAt: attempt.updatedAt,
      deletedAt: attempt.deletedAt,
    );
  }

  static List<Card> toDTOList(List<CardEntity> attempts) => attempts
      .map(
        (attempt) => toDTO(attempt),
      )
      .toList();
}
