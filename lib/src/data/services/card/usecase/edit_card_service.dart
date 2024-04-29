import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/card/entity/card.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:flash_focus/src/domain/card/port/usecase/edit_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/edit_card_usecase.dart';

class EditCardService implements EditCardUseCase {
  final CardRepositoryPort cardRepository;

  EditCardService({
    required this.cardRepository,
  });

  @override
  Future<CardEntity> call({
    required EditCardPort input,
  }) async {
    try {
      CardEntity card = await cardRepository.findCard(
        id: input.cardId,
        option: const RepositoryFindOptions(includeRemoved: false),
      );

      card.edit(
        frontContent: input.frontContent,
        frontTitle: input.frontTitle,
        backContent: input.backContent,
        backTitle: input.backTitle,
      );

      await cardRepository.updateCard(card: card);

      return card;
    } catch (e) {
      rethrow;
    }
  }
}
