import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/card/port/usecase/get_card_port.dart';
import 'package:flash_focus/src/domain/card/usecase/dto/card.dart';

abstract class GetCardUseCase extends UseCase<GetCardPort, Card> {}
