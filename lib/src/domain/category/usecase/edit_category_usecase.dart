import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/port/usecase/edit_category_port.dart';

abstract class EditCategoryUseCase extends UseCase<EditCategoryPort, CategoryEntity> {}
