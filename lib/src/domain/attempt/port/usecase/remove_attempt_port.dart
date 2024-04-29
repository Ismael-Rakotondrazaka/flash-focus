import 'package:flutter/material.dart';

@immutable
abstract class RemoveAttemptPort {
  final int attemptId;
  final bool? disableSoftDeleting;

  const RemoveAttemptPort({
    required this.attemptId,
    this.disableSoftDeleting,
  });
}
