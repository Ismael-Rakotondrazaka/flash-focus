import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/card/entity/card_entity.dart';
import 'package:flash_focus/src/domain/card/port/usecase/get_card_port.dart';

abstract class GetCardUseCase extends UseCase<GetCardPort, CardEntity> {}
