import 'package:flash_focus/src/core/exception/internal_exception.dart';
import 'package:flash_focus/src/core/exception/unknown_exception.dart';
import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flash_focus/src/core/persistance/repository_option.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt_entity.dart';
import 'package:flash_focus/src/domain/attempt/port/persistance/attempt_repository_port.dart';
import 'package:flash_focus/src/domain/attempt/port/usecase/get_attempt_list_port.dart';
import 'package:flash_focus/src/domain/attempt/usecase/dto/attempt.dart';
import 'package:flash_focus/src/domain/attempt/usecase/dto/attempt_dto_mapper.dart';
import 'package:flash_focus/src/domain/attempt/usecase/get_attempt_list_usecase.dart';

class GetAttemptListService implements GetAttemptListUseCase {
  final AttemptRepositoryPort attemptRepository;

  const GetAttemptListService({
    required this.attemptRepository,
  });

  @override
  Future<List<Attempt>> call({
    required GetAttemptListPort input,
  }) async {
    try {
      List<AttemptEntity> attempts = await attemptRepository.findAttempts(
        attemptIds: IntIdentifier.tryFromList(input.attemptIds),
        cardId: StringIdentifier.tryFrom(input.cardId),
        createdAt: input.createdAt,
        isSuccess: input.isSuccess,
        option: RepositoryFindOptions(
          includeRemoved: input.includeRemoved ?? false,
        ),
      );

      return AttemptDTOMapper.toDTOList(attempts);
    } on InternalException {
      rethrow;
    } catch (e) {
      throw UnknownException();
    }
  }
}
