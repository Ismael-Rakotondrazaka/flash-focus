import 'package:flash_focus/src/core/exception/internal_exception.dart';

class DatabaseNotOpenedYetException extends InternalException<void> {
  const DatabaseNotOpenedYetException()
      : super(
          data: null,
          message: "The database is not opened yet.",
        );
}
