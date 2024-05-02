import 'package:flash_focus/src/core/exception/internal_exception.dart';
import 'package:flash_focus/src/core/exception/unknown_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flash_focus/src/domain/attempt/port/persistance/attempt_repository_port.dart';
import 'package:flash_focus/src/domain/attempt/port/usecase/remove_attempt_list_port.dart';
import 'package:flash_focus/src/domain/attempt/usecase/remove_attempt_list_usecase.dart';

class RemoveAttemptListService implements RemoveAttemptListUseCase {
  final AttemptRepositoryPort attemptRepository;

  const RemoveAttemptListService({
    required this.attemptRepository,
  });

  @override
  Future<void> call({
    required RemoveAttemptListPort input,
  }) async {
    try {
      List<AttemptEntity> attempts = await attemptRepository.findAttempts(
        attemptIds: IntIdentifier.fromList(input.attemptIds),
      );

      for (var attempt in attempts) {
        attempt.remove();
      }

      await attemptRepository.removeAttempts(
        attempts: attempts,
        option: RepositoryRemoveOptions(
          disableSoftDeleting: input.disableSoftDeleting ?? false,
        ),
      );
    } on InternalException {
      rethrow;
    } catch (e) {
      throw const UnknownException();
    }
  }
}
