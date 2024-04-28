import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt.dart';
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
        cardId: input.cardId,
        createdAt: input.createdAt,
        option: const RepositoryFindOptions(
          includeRemoved: false,
        ),
        result: input.result,
      );

      return attempts;
    } catch (e) {
      rethrow;
    }
  }
}
