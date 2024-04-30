import 'package:flash_focus/src/core/usecase/usecase.dart';
import 'package:flash_focus/src/domain/attempt/port/usecase/create_attempt_port.dart';
import 'package:flash_focus/src/domain/attempt/usecase/dto/attempt.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateAttemptUseCase
    extends UseCase<CreateAttemptPort, Attempt> {}
