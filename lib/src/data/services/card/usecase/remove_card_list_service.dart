import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:flash_focus/src/domain/card/port/usecase/remove_card_list_port.dart';
import 'package:flash_focus/src/domain/card/usecase/remove_card_list_usecase.dart';

class RemoveCardListService implements RemoveCardListUseCase {
  final CardRepositoryPort attemptRepository;

  const RemoveCardListService({
    required this.attemptRepository,
  });

  @override
  Future<void> call({
    required RemoveCardListPort input,
  }) async {
    try {
      List<CardEntity> cards = await attemptRepository.findCards(
        cardIds: input.cardIds,
        option: const RepositoryFindOptions(
          includeRemoved: true,
        ),
      );

      for (var attempt in cards) {
        attempt.remove();
      }

      await attemptRepository.removeCards(
        cards: cards,
        option: RepositoryRemoveOptions(
          disableSoftDeleting: input.disableSoftDeleting ?? false,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
