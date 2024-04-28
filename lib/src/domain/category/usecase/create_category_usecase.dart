import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/category/entity/category.dart';
import 'package:flash_focus/src/domain/category/port/usecase/create_category_port.dart';

abstract class CreateCategoryUseCase extends UseCase<CreateCategoryPort, CategoryEntity> {}
