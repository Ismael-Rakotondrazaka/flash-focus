import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/port/usecase/create_card_port.dart';

abstract class CreateCardUseCase extends UseCase<CreateCardPort, CardEntity> {}
