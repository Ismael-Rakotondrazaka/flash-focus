import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/card/entity/card.dart';
import 'package:flash_focus/src/domain/card/port/usecase/edit_card_port.dart';

abstract class EditCardUseCase extends UseCase<EditCardPort, CardEntity> {}
