import 'package:flash_focus/src/domain/attempt/entity/attempt.dart';
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
      await cardRepository.findCard(
        id: input.cardId,
      );

      AttemptEntity attempt = AttemptEntity(
        cardId: input.cardId,
        result: input.result,
      );

      await attemptRepository.addAttempt(attempt: attempt);

      return attempt;
    } catch (e) {
      rethrow;
    }
  }
}
