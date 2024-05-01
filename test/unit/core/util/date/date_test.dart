import 'package:flash_focus/src/core/util/date/copy_date_time.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("copyDateTime", () {
    test('should copy the given DateTime object', () {
      // Given
      final original = DateTime(2021, 1, 1, 12, 0, 0, 0, 0);
      const toUtc = false;
      const addDuration = null;
      const subtractDuration = null;

      // When
      final result = copyDateTime(
        original,
        toUtc: toUtc,
        addDuration: addDuration,
        subtractDuration: subtractDuration,
      );

      // Then
      expect(result.isUtc, original.isUtc);
      expect(result.year, 2021);
      expect(result.month, 1);
      expect(result.day, 1);
      expect(result.hour, 12);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });

    test(
        "when given 'toUtc' as true, should return a UTC DateTime object, with the timezone difference considered",
        () {
      // Given
      final original = DateTime(2021, 1, 1, 12, 0, 0, 0, 0);
      const toUtc = true;
      const addDuration = null;
      const subtractDuration = null;

      final timeZoneDifference = original.timeZoneOffset.inHours;

      // When
      final result = copyDateTime(
        original,
        toUtc: toUtc,
        addDuration: addDuration,
        subtractDuration: subtractDuration,
      );

      // Then
      expect(result.isUtc, isTrue);

      expect(result.year, 2021);
      expect(result.month, 1);
      expect(result.day, 1);
      expect(result.hour, 12 - timeZoneDifference);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });

    test(
        "when given 'addDuration' as a Duration object, should return a DateTime object with the given duration added",
        () {
      // Given
      final original = DateTime(2021, 1, 1, 12, 0, 0, 0, 0);
      const toUtc = false;
      const addDuration = Duration(days: 1);
      const subtractDuration = null;

      // When
      final result = copyDateTime(
        original,
        toUtc: toUtc,
        addDuration: addDuration,
        subtractDuration: subtractDuration,
      );

      // Then
      expect(result.year, 2021);
      expect(result.month, 1);
      expect(result.day, 2);
      expect(result.hour, 12);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });

    test(
        "when given 'subtractDuration' as a Duration object, should return a DateTime object with the given duration subtracted",
        () {
      // Given
      final original = DateTime(2021, 1, 1, 12, 0, 0, 0, 0);
      const toUtc = false;
      const addDuration = null;
      const subtractDuration = Duration(days: 1);

      // When
      final result = copyDateTime(
        original,
        toUtc: toUtc,
        addDuration: addDuration,
        subtractDuration: subtractDuration,
      );

      // Then
      expect(result.year, 2020);
      expect(result.month, 12);
      expect(result.day, 31);
      expect(result.hour, 12);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });

    test(
        "when given 'toUtc' as true, 'addDuration' as a Duration object, and 'subtractDuration' as a Duration object, should return a UTC DateTime object with the given duration added and subtracted",
        () {
      // Given
      final original = DateTime(2021, 1, 1, 12, 0, 0, 0, 0);
      const toUtc = true;
      const addDuration = Duration(days: 1);
      const subtractDuration = Duration(hours: 1);

      final timeZoneDifference = original.timeZoneOffset.inHours;

      // When
      final result = copyDateTime(
        original,
        toUtc: toUtc,
        addDuration: addDuration,
        subtractDuration: subtractDuration,
      );

      // Then
      expect(result.isUtc, isTrue);

      expect(result.year, 2021);
      expect(result.month, 1);
      expect(result.day, 2);
      expect(result.hour, 12 - timeZoneDifference - 1);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });
  });
}
