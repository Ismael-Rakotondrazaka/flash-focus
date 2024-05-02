import 'package:flash_focus/src/core/exception/internal_exception.dart';
import 'package:flash_focus/src/core/exception/unknown_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';
import 'package:flash_focus/src/domain/card/port/usecase/get_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/dto/card.dart';
import 'package:flash_focus/src/domain/card/usecase/dto/card_dto_mapper.dart';
import 'package:flash_focus/src/domain/card/usecase/get_card_usecase.dart';

class GetCardService implements GetCardUseCase {
  final CardRepositoryPort cardRepository;

  GetCardService({
    required this.cardRepository,
  });

  @override
  Future<Card> call({
    required GetCardPort input,
  }) async {
    try {
      CardEntity card = await cardRepository.findCard(
        id: StringIdentifier.from(input.cardId),
        option: RepositoryFindOptions(
          includeRemoved: input.includeRemoved ?? false,
        ),
      );

      return CardDTOMapper.toDTO(card);
    } on InternalException {
      rethrow;
    } catch (e) {
      throw const UnknownException();
    }
  }
}
