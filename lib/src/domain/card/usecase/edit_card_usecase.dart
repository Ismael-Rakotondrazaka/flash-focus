import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/card/port/usecase/edit_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/dto/card.dart';

abstract class EditCardUseCase extends UseCase<EditCardPort, Card> {}
