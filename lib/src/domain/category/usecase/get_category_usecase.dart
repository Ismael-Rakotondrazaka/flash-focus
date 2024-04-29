import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/port/usecase/get_category_port.dart';

abstract class GetCategoryUseCase extends UseCase<GetCategoryPort, CategoryEntity> {}
