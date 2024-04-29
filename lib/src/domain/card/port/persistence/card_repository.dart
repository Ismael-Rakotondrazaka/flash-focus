import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/card/entity/card.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CardRepositoryPort {
  Future<List<CardEntity>> findCards({
    String? front,
    String? back,
    RepositoryFindOptions? option,
  });

  Future<CardEntity> findCard({
    StringIdentifier? id,
    RepositoryFindOptions? option,
  });

  Future<StringIdentifier> addCard({
    required CardEntity card,
  });

  Future<void> updateCard({
    required CardEntity card,
  });

  Future<void> updateCards({
    List<StringIdentifier>? ids,
    DateTime deletedAt,
    RepositoryFindOptions? option,
  });

  Future<void> removeCard({
    required CardEntity card,
    RepositoryRemoveOptions? option,
  });
}
