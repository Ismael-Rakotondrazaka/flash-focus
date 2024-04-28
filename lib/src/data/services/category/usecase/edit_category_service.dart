

import 'package:flash_focus/src/domain/category/entity/category.dart';
import 'package:flash_focus/src/domain/category/port/persistance/category_repository_port.dart';
import 'package:flash_focus/src/domain/category/port/usecase/edit_category_port.dart';
import 'package:flash_focus/src/domain/category/usecase/edit_category_usecase.dart';

class EditCategoryService implements EditCategoryUseCase {
  final CategoryRepositoryPort categoryRepository;

  const EditCategoryService({
    required this.categoryRepository,
  });

  @override
  Future<CategoryEntity> call({
    required EditCategoryPort input,
  }) async {
    try {
      CategoryEntity category = await categoryRepository.findCategory(
        id: input.id,
      );

      category.edit(name: input.name);

      await categoryRepository.updateCategory(category: category);

      return category;
    } catch (e) {
      rethrow;
    }
  }
}
