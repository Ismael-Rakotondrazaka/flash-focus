import 'package:flash_focus/src/core/exception/internal_exception.dart';

class IdentifierNotAssignedException extends InternalException<void> {
  IdentifierNotAssignedException({
    String? message,
    super.description,
  }) : super(
          data: null,
          message: message ?? "The model must be saved before using it.",
        );
}
