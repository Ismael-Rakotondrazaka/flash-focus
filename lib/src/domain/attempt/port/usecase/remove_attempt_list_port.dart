import 'package:flutter/material.dart';

@immutable
abstract class RemoveAttemptListPort {
  final List<int> attemptIds;
  final bool? disableSoftDeleting;

  const RemoveAttemptListPort({
    required this.attemptIds,
    this.disableSoftDeleting,
  });
}
