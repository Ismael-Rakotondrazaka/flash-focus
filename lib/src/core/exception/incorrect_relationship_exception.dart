import 'package:flash_focus/src/core/exception/internal_exception.dart';

class IncorrectRelationshipException<T extends String> extends InternalException<T> {
  const IncorrectRelationshipException({
    String? message,
    super.description,
    required super.data,
  }) : super(
          message: message ?? "The relation is incorrect.",
        );
}
