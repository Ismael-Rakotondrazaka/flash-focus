import 'package:flash_focus/src/core/exception/database_already_opened_exception.dart';
import 'package:flash_focus/src/core/exception/database_not_opened_yet_exception.dart';
import 'package:flash_focus/src/core/exception/file_system_rw_exception.dart';
import 'package:flash_focus/src/core/exception/identifier_not_assigned_exception.dart';
import 'package:flash_focus/src/core/exception/incorrect_relationship_exception.dart';
import 'package:flash_focus/src/core/exception/internal_exception.dart';
import 'package:flash_focus/src/core/exception/not_found_exception.dart';
import 'package:flash_focus/src/core/exception/unknown_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("InternalException", () {
    test('should extends Exception', () {
      const instance = InternalException(message: "error message", data: 456);

      expect(instance, isA<Exception>());
    });

    test(
        "when given custom args, should return an instance with the given args",
        () {
      const customMessage = "Custom error message.";
      const customData = 123;
      const customDescription = "Custom description.";
      const instance = InternalException(
          message: customMessage,
          data: customData,
          description: customDescription);

      expect(instance.message, customMessage);
      expect(instance.data, customData);
      expect(instance.description, customDescription);
    });
  });

  group("DatabaseAlreadyOpenedException", () {
    test('should extends InternalException', () {
      const instance = DatabaseAlreadyOpenedException();

      expect(instance, isA<InternalException>());
    });
  });

  group("DatabaseNotOpenedYetException", () {
    test('should extends InternalException', () {
      const instance = DatabaseNotOpenedYetException();

      expect(instance, isA<InternalException>());
    });
  });

  group("FileSystemRWException", () {
    test('should extends InternalException', () {
      const instance = FileSystemRWException();

      expect(instance, isA<InternalException>());
    });
  });

  group("IdentifierNotAssignedException", () {
    test('should extends InternalException', () {
      const instance = IdentifierNotAssignedException();

      expect(instance, isA<InternalException>());
    });
  });

  group("IncorrectRelationshipException", () {
    test('should extends InternalException', () {
      const instance = IncorrectRelationshipException(
        data: "custom relationship",
      );

      expect(instance, isA<InternalException>());
    });
  });

  group("NotFoundException", () {
    test('should extends InternalException', () {
      const instance = NotFoundException();

      expect(instance, isA<InternalException>());
    });
  });

  group("UnknownException", () {
    test('should extends InternalException', () {
      const instance = UnknownException();

      expect(instance, isA<InternalException>());
    });
  });
}
