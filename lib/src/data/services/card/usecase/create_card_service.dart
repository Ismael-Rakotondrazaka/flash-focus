import 'package:flash_focus/src/domain/card/entity/card.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:flash_focus/src/domain/card/port/usecase/create_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/create_card_usecase.dart';

class CreateCardService implements CreateCardUseCase {
  final CardRepositoryPort cardRepository;

  CreateCardService({
    required this.cardRepository,
  });

  @override
  Future<CardEntity> call({
    required CreateCardPort input,
  }) async {
    try {
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
      );

      await cardRepository.addCard(card: card);

      return card;
    } catch (e) {
      rethrow;
    }
  }
}
