import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/attempt/port/usecase/remove_attempt_port.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RemoveAttemptUseCase extends UseCase<RemoveAttemptPort, void> {}
