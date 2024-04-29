import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/card/sqlite_card.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/entity/category/sqlite_category_mapper.dart';
import 'package:flash_focus/src/domain/card/entity/card.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SQLiteCardMapper {
  static CardEntity toDomainEntity(SQLiteCard sqLiteCard) {
    return CardEntity(
      id: StringIdentifier(value: sqLiteCard.id),
      categoryId: sqLiteCard.categoryId != null
          ? IntIdentifier(
              value: int.parse(sqLiteCard.categoryId!),
            )
          : null,
      category: sqLiteCard.category != null
          ? SQLiteCategoryMapper.toDomainEntity(
              sqLiteCard.category!,
            )
          : null,
      createdAt: DateTime.parse(sqLiteCard.createdAt),
      updatedAt: DateTime.parse(sqLiteCard.updatedAt),
      deletedAt: sqLiteCard.deletedAt != null
          ? DateTime.parse(sqLiteCard.deletedAt!)
          : null,
      front: CardSide(
        content: sqLiteCard.frontContent,
        title: sqLiteCard.frontTitle,
      ),
      back: CardSide(
        content: sqLiteCard.frontContent,
        title: sqLiteCard.frontTitle,
      ),
    );
  }

  static SQLiteCard toSQLiteEntity(CardEntity cardEntity) {
    return SQLiteCard(
      id: cardEntity.id.value,
      categoryId: cardEntity.categoryId?.value.toString(),
      createdAt: cardEntity.createdAt.toIso8601String(),
      updatedAt: cardEntity.updatedAt.toIso8601String(),
      deletedAt: cardEntity.deletedAt?.toIso8601String(),
      frontContent: cardEntity.front.content,
      frontTitle: cardEntity.front.title,
      backContent: cardEntity.back.content,
      backTitle: cardEntity.back.title,
      category: cardEntity.category != null
          ? SQLiteCategoryMapper.toSQLiteEntity(cardEntity.category!)
          : null,
    );
  }

  static List<CardEntity> toDomainEntities(List<SQLiteCard> sqLiteCards) {
    return sqLiteCards
        .map((SQLiteCard sqLiteCard) => toDomainEntity(sqLiteCard))
        .toList();
  }
}
