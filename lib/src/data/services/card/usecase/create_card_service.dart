import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/card/entity/card.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:flash_focus/src/domain/card/port/usecase/create_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/create_card_usecase.dart';
import 'package:flash_focus/src/domain/category/entity/category.dart';
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
      if (input.categoryId is IntIdentifier) {
        category = await categoryRepository.findCategory(id: input.categoryId);
      }

      CardEntity card = CardEntity(
        front: CardSide(
          content: input.frontContent,
          title: input.frontTitle,
        ),
        back: CardSide(
          content: input.backContent,
          title: input.backTitle,
        ),
        categoryId: input.categoryId,
        category: category,
      );

      await cardRepository.addCard(card: card);

      return card;
    } catch (e) {
      rethrow;
    }
  }
}
