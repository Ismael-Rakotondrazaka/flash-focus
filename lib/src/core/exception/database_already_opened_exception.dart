import 'package:flash_focus/src/core/exception/internal_exception.dart';

class DatabaseAlreadyOpenedException extends InternalException<void> {
  const DatabaseAlreadyOpenedException()
      : super(
          data: null,
          message: "The database is already opened.",
        );
}
