import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/port/persistance/category_repository_port.dart';
import 'package:flash_focus/src/domain/category/port/usecase/get_category_list_port.dart';
import 'package:flash_focus/src/domain/category/usecase/get_category_list_usecase.dart';

class GetCategoryListService implements GetCategoryListUseCase {
  final CategoryRepositoryPort categoryRepository;

  const GetCategoryListService({
    required this.categoryRepository,
  });

  @override
  Future<List<CategoryEntity>> call({
    required GetCategoryListPort input,
  }) async {
    try {
      List<CategoryEntity> categories = await categoryRepository.findCategories(
        name: input.name,
        categoryIds: input.categoryIds,
        option: RepositoryFindOptions(
          includeRemoved: input.includeRemoved,
        ),
      );

      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
