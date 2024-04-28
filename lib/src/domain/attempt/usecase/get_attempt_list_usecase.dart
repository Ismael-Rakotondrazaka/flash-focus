import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/attempt/entity/attempt.dart';
import 'package:flash_focus/src/domain/attempt/port/usecase/get_attempt_list_port.dart';

abstract class GetAttemptListUseCase extends UseCase<GetAttemptListPort, AttemptEntity> {}
