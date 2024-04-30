import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/port/persistance/category_repository_port.dart';
import 'package:flash_focus/src/domain/category/port/usecase/edit_category_port.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category_dto_mapper.dart';
import 'package:flash_focus/src/domain/category/usecase/edit_category_usecase.dart';

class EditCategoryService implements EditCategoryUseCase {
  final CategoryRepositoryPort categoryRepository;

  const EditCategoryService({
    required this.categoryRepository,
  });

  @override
  Future<Category> call({
    required EditCategoryPort input,
  }) async {
    try {
      CategoryEntity category = await categoryRepository.findCategory(
        id: IntIdentifier.from(input.id),
        option: const RepositoryFindOptions(includeRemoved: true),
      );

      category.edit(name: input.name);

      await categoryRepository.updateCategory(category: category);

      return CategoryDTOMapper.toDTO(category);
    } catch (e) {
      rethrow;
    }
  }
}
