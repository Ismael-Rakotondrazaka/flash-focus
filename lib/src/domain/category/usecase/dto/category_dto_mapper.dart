import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class CategoryDTOMapper {
  static Category toDTO(CategoryEntity category) {
    return Category(
      id: category.id.value,
      name: category.name,
    );
  }

  static List<Category> toDTOList(List<CategoryEntity> categories) => categories
      .map(
        (category) => toDTO(category),
      )
      .toList();
}
