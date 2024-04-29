import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/category/port/usecase/remove_category_list_port.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RemoveCategoryListUseCase
    extends UseCase<RemoveCategoryListPort, void> {}
