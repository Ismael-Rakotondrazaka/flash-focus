import 'package:flash_focus/src/domain/category/entity/category.dart';
import 'package:flash_focus/src/domain/category/port/persistance/category_repository_port.dart';
import 'package:flash_focus/src/domain/category/port/usecase/remove_category_list_port.dart';
import 'package:flash_focus/src/domain/category/usecase/remove_category_list_usecase.dart';

class RemoveCategoryListService implements RemoveCategoryListUseCase {
  final CategoryRepositoryPort categoryRepository;

  const RemoveCategoryListService({
    required this.categoryRepository,
  });

  @override
  Future<void> call({
    required RemoveCategoryListPort input,
  }) async {
    try {
      List<CategoryEntity> categories = await categoryRepository.findCategories(
        categoryIds: input.categoryIds,
      );

      await categoryRepository.removeCategories(categories: categories);
    } catch (e) {
      rethrow;
    }
  }
}
