import 'package:flash_focus/src/core/entity/entity.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CategoryEntity", () {
    group("parent", () {
      test('should be Entity', () {
        final category = CategoryEntity(
          id: const IntIdentifier(value: 1),
          name: 'Category 1',
        );

        expect(category, isA<Entity>());
      });
    });

    group("constructor", () {
      test("should return an instance of CategoryEntity with given properties",
          () {
        final category = CategoryEntity(
          id: const IntIdentifier(value: 1),
          name: 'Category 1',
        );

        expect(category, isA<CategoryEntity>());
        expect(category.id, const IntIdentifier(value: 1));
        expect(category.name, 'Category 1');
      });
    });

    group("comparison", () {
      test('should return true when the two categories are equal', () {
        final category1 = CategoryEntity(
          id: const IntIdentifier(value: 1),
          name: 'Category 1',
        );
        final category2 = CategoryEntity(
          id: const IntIdentifier(value: 1),
          name: 'Category 1',
        );
        expect(category1, category2);
      });

      test('should return false when the two categories are different', () {
        final category1 = CategoryEntity(
          id: const IntIdentifier(value: 1),
          name: 'Category 1',
        );
        final category2 = CategoryEntity(
          id: const IntIdentifier(value: 2),
          name: 'Category 2',
        );
        expect(category1, isNot(category2));
      });
    });

    group("edit", () {
      test('should return the new name', () {
        final category = CategoryEntity(
          id: const IntIdentifier(value: 1),
          name: 'Category 1',
        );

        category.edit(name: 'Category 2');

        expect(category.name, 'Category 2');
      });
    });
  });
}
