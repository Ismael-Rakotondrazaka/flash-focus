

import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/port/persistance/category_repository_port.dart';
import 'package:flash_focus/src/domain/category/port/usecase/create_category_port.dart';
import 'package:flash_focus/src/domain/category/usecase/create_category_usecase.dart';

class CreateCategoryService implements CreateCategoryUseCase {
  final CategoryRepositoryPort categoryRepository;

  const CreateCategoryService({
    required this.categoryRepository,
  });

  @override
  Future<CategoryEntity> call({
    required CreateCategoryPort input,
  }) async {
    try {
      CategoryEntity category = CategoryEntity(
        name: input.name,
      );

      await categoryRepository.addCategory(category: category);

      return category;
    } catch (e) {
      rethrow;
    }
  }
}
