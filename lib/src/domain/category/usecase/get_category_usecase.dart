import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/category/port/usecase/get_category_port.dart';
import 'package:flash_focus/src/domain/category/usecase/dto/category.dart';

abstract class GetCategoryUseCase extends UseCase<GetCategoryPort, Category> {}
