import 'package:flash_focus/src/core/exception/internal_exception.dart';

class NotFoundException extends InternalException<void> {
  const NotFoundException({
    String? message,
    super.description,
  }) : super(
          data: null,
          message: message ?? "The resource could not be found.",
        );
}
