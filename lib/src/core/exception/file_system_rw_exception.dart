import 'package:flash_focus/src/core/exception/internal_exception.dart';

class FileSystemRWException extends InternalException<void> {
  const FileSystemRWException()
      : super(
          data: null,
          message: "Could not read or write on the file system.",
          description:
              "Please, grant access to the application in the settings.",
        );
}
