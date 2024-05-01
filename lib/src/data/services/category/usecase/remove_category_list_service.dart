import 'package:flash_focus/src/core/exception/internal_exception.dart';
import 'package:flash_focus/src/core/exception/unknown_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
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
        categoryIds: IntIdentifier.fromList(input.categoryIds),
        option: const RepositoryFindOptions(
          includeRemoved: true,
        ),
      );

      await categoryRepository.removeCategories(categories: categories);
    } on InternalException {
      rethrow;
    } catch (e) {
      throw UnknownException();
    }
  }
}
