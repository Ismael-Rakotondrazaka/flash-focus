import 'package:flash_focus/src/core/exception/internal_exception.dart';
import 'package:flash_focus/src/core/exception/unknown_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:flash_focus/src/domain/card/port/usecase/remove_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/remove_card_usecase.dart';

class RemoveCardService implements RemoveCardUseCase {
  final CardRepositoryPort cardRepository;

  RemoveCardService({
    required this.cardRepository,
  });

  @override
  Future<CardEntity> call({
    required RemoveCardPort input,
  }) async {
    try {
      CardEntity card = await cardRepository.findCard(
        id: StringIdentifier.from(input.cardId),
        option: const RepositoryFindOptions(
          includeRemoved: true,
        ),
      );

      card.remove();

      await cardRepository.removeCard(
        card: card,
        option: RepositoryRemoveOptions(
          disableSoftDeleting: input.disableSoftDeleting,
        ),
      );

      return card;
    } on InternalException {
      rethrow;
    } catch (e) {
      throw UnknownException();
    }
  }
}
