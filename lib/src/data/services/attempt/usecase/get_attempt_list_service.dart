import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flash_focus/src/domain/attempt/port/persistance/attempt_repository_port.dart';
import 'package:flash_focus/src/domain/attempt/port/usecase/get_attempt_list_port.dart';
import 'package:flash_focus/src/domain/attempt/usecase/get_attempt_list_usecase.dart';

class GetAttemptListService implements GetAttemptListUseCase {
  final AttemptRepositoryPort attemptRepository;

  const GetAttemptListService({
    required this.attemptRepository,
  });

  @override
  Future<List<AttemptEntity>> call({
    required GetAttemptListPort input,
  }) async {
    try {
      List<AttemptEntity> attempts = await attemptRepository.findAttempts(
        attemptIds: input.attemptIds,
        cardId: input.cardId,
        createdAt: input.createdAt,
        isSuccess: input.isSuccess,
        option: RepositoryFindOptions(
          includeRemoved: input.includeRemoved ?? false,
        ),
      );

      return attempts;
    } catch (e) {
      rethrow;
    }
  }
}
