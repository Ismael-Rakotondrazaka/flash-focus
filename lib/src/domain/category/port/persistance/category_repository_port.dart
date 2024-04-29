import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/category/entity/category.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryRepositoryPort {
  Future<List<CategoryEntity>> findCategories({
    String? name,
    RepositoryFindOptions? option,
  });

  Future<CategoryEntity> findCategory({
    IntIdentifier? id,
    RepositoryFindOptions? option,
  });

  Future<IntIdentifier> addCategory({
    required CategoryEntity category,
  });

  Future<void> updateCategory({
    required CategoryEntity category,
  });

  Future<void> removeCategory({
    required CategoryEntity category,
    RepositoryRemoveOptions? option,
  });

  Future<void> removeCategories({
    required List<CategoryEntity> categories,
    RepositoryRemoveOptions? option,
  });
}
