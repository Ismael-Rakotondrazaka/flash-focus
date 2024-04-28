import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/category/entity/category.dart';
import 'package:flash_focus/src/domain/category/port/usecase/get_category_list_port.dart';

abstract class GetCategoryListUseCase extends UseCase<GetCategoryListPort, List<CategoryEntity>> {}
