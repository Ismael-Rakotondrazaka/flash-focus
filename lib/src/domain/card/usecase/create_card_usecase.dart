import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/card/port/usecase/create_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/dto/card.dart';

abstract class CreateCardUseCase extends UseCase<CreateCardPort, Card> {}
