import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:flash_focus/src/domain/card/port/usecase/get_card_list_port.dart';
import 'package:flash_focus/src/domain/card/usecase/get_card_list_usecase.dart';

class GetCardListService implements GetCardListUseCase {
  final CardRepositoryPort cardRepository;

  GetCardListService({
    required this.cardRepository,
  });

  @override
  Future<List<CardEntity>> call({
    required GetCardListPort input,
  }) async {
    try {
      List<CardEntity> cards = await cardRepository.findCards(
        cardIds: StringIdentifier.tryFromList(input.cardIds),
        back: input.back,
        front: input.front,
        option: RepositoryFindOptions(
          includeRemoved: input.includeRemoved,
        ),
      );

      return cards;
    } catch (e) {
      rethrow;
    }
  }
}
