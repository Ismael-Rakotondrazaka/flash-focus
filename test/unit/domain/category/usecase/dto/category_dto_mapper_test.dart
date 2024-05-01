import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category_dto_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CategoryDTOMapper", () {
    test('should return the category DTO', () {
      final category = CategoryEntity(
        id: const IntIdentifier(value: 1),
        name: 'Category 1',
      );
      final categoryDTO = CategoryDTOMapper.toDTO(category);

      expect(categoryDTO, isA<Category>());
      expect(categoryDTO.id, 1);
      expect(categoryDTO.name, 'Category 1');
    });

    test('should return the list of category DTO', () {
      final categories = [
        CategoryEntity(
          id: const IntIdentifier(value: 1),
          name: 'Category 1',
        ),
        CategoryEntity(
          id: const IntIdentifier(value: 2),
          name: 'Category 2',
        ),
      ];
      final categoriesDTO = CategoryDTOMapper.toDTOList(categories);
      expect(categoriesDTO.length, 2);

      final isAllInstanceOfCategory =
          // ignore: unnecessary_type_check
          categoriesDTO.every((category) => category is Category);
      expect(isAllInstanceOfCategory, true);

      expect(categoriesDTO[0].id, 1);
      expect(categoriesDTO[0].name, 'Category 1');
      expect(categoriesDTO[1].id, 2);
      expect(categoriesDTO[1].name, 'Category 2');
    });
  });
}
