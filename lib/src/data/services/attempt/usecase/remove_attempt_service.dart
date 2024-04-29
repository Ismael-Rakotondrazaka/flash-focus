import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
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
        id: IntIdentifier.from(input.attemptId),
        option: const RepositoryFindOptions(includeRemoved: true),
      );

      attempt.remove();

      await attemptRepository.removeAttempt(
        attempt: attempt,
        option: RepositoryRemoveOptions(
          disableSoftDeleting: input.disableSoftDeleting ?? false,
        ),
      );

      return attempt;
    } catch (e) {
      rethrow;
    }
  }
}
