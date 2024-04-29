import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flash_focus/src/domain/attempt/port/persistance/attempt_repository_port.dart';
import 'package:flash_focus/src/domain/attempt/port/usecase/create_attempt_port.dart';
import 'package:flash_focus/src/domain/attempt/usecase/create_attempt_usecase.dart';
import 'package:flash_focus/src/domain/card/port/persistence/card_repository.dart';

class CreateAttemptService implements CreateAttemptUseCase {
  final CardRepositoryPort cardRepository;
  final AttemptRepositoryPort attemptRepository;

  const CreateAttemptService({
    required this.cardRepository,
    required this.attemptRepository,
  });

  @override
  Future<AttemptEntity> call({
    required CreateAttemptPort input,
  }) async {
    try {
      StringIdentifier cardId = StringIdentifier.from(input.cardId);

      await cardRepository.findCard(
        id: cardId,
      );

      AttemptEntity attempt = AttemptEntity(
        cardId: cardId,
        isSuccess: input.isSuccess,
      );

      await attemptRepository.addAttempt(attempt: attempt);

      return attempt;
    } catch (e) {
      rethrow;
    }
  }
}
