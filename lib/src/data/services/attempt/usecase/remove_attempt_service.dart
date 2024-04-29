import 'package:flash_focus/src/domain/attempt/entity/attempt.dart';
import 'package:flash_focus/src/domain/attempt/port/persistance/attempt_repository_port.dart';
import 'package:flash_focus/src/domain/attempt/port/usecase/remove_attempt_port.dart';
import 'package:flash_focus/src/domain/attempt/usecase/remove_attempt_usecase.dart';

class RemoveAttemptService implements RemoveAttemptUseCase {
  final AttemptRepositoryPort attemptRepository;

  const RemoveAttemptService({
    required this.attemptRepository,
  });

  @override
  Future<AttemptEntity> call({
    required RemoveAttemptPort input,
  }) async {
    try {
      AttemptEntity attempt = await attemptRepository.findAttempt(
        id: input.attemptId,
      );

      attempt.remove();

      await attemptRepository.removeAttempt(attempt: attempt);

      return attempt;
    } catch (e) {
      rethrow;
    }
  }
}
