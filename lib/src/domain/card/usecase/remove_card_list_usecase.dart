import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/card/port/usecase/remove_card_list_port.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RemoveCardListUseCase
    extends UseCase<RemoveCardListPort, void> {}
