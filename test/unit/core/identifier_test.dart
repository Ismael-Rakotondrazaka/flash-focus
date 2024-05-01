import 'package:flash_focus/src/core/identifier/identifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("IntIdentifier", () {
    test("should extends Identifier", () {
      const instance = IntIdentifier(value: 0);

      expect(instance, isA<Identifier>());
    });

    test(
        "when given custom value, should return an instance with the given value",
        () {
      const customValue = 70;
      const instance = IntIdentifier(value: customValue);

      expect(instance.value, customValue);
    });
  });

  group("StringIdentifier", () {
    test("should extends Identifier", () {
      const instance = StringIdentifier(value: "");

      expect(instance, isA<Identifier>());
    });

    test(
        "when given custom value, should return an instance with the given value",
        () {
      const customValue = "custom value";
      const instance = StringIdentifier(value: customValue);

      expect(instance.value, customValue);
    });
  });
}
