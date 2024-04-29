import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:flash_focus/src/domain/card/port/usecase/create_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/create_card_usecase.dart';
import 'package:flash_focus/src/domain/category/entity/category_entity.dart';
import 'package:flash_focus/src/domain/category/port/persistance/category_repository_port.dart';

class CreateCardService implements CreateCardUseCase {
  final CategoryRepositoryPort categoryRepository;
  final CardRepositoryPort cardRepository;

  CreateCardService({
    required this.categoryRepository,
    required this.cardRepository,
  });

  @override
  Future<CardEntity> call({
    required CreateCardPort input,
  }) async {
    try {
      CategoryEntity? category;
      if (input.categoryId is int) {
        category = await categoryRepository.findCategory(
          id: IntIdentifier.from(input.categoryId!),
          option: const RepositoryFindOptions(
            includeRemoved: false,
          ),
        );
      }

      CardEntity card = CardEntity(
        front: CardSideEntity(
          content: input.frontContent,
          title: input.frontTitle,
        ),
        back: CardSideEntity(
          content: input.backContent,
          title: input.backTitle,
        ),
        categoryId: IntIdentifier.tryFrom(input.categoryId),
        category: category,
      );

      await cardRepository.addCard(card: card);

      return card;
    } catch (e) {
      rethrow;
    }
  }
}
