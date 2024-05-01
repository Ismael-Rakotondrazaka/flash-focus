import 'package:flash_focus/src/core/exception/internal_exception.dart';

class UnknownException extends InternalException<void> {
  UnknownException()
      : super(
          data: null,
          message: "An unknown error occurred.",
        );
}
