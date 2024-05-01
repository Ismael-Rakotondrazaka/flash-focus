import 'package:flash_focus/src/domain/category/usecase/dto/category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("New", () {
    test('should return the category properties', () {
      const category = Category(
        id: 1,
        name: 'Category 1',
      );

      expect(category.id, 1);
      expect(category.name, 'Category 1');
    });
  });

  group("Comparison", () {
    test('should return true when the two categories are equal', () {
      const category1 = Category(
        id: 1,
        name: 'Category 1',
      );
      const category2 = Category(
        id: 1,
        name: 'Category 1',
      );
      expect(category1.hashCode, category2.hashCode);
    });

    test('should return false when the two categories are different', () {
      const category1 = Category(
        id: 1,
        name: 'Category 1',
      );
      const category2 = Category(
        id: 2,
        name: 'Category 2',
      );
      expect(category1.hashCode, isNot(category2.hashCode));
    });
  });
}
