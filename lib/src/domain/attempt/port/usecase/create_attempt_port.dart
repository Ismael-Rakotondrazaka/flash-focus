import 'package:flutter/material.dart';

@immutable
abstract class CreateAttemptPort {
  final String cardId;
  final bool isSuccess;

  const CreateAttemptPort({
    required this.cardId,
    required this.isSuccess,
  });
}
