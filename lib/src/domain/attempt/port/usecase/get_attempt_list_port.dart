import 'package:flutter/material.dart';

@immutable
abstract class GetAttemptListPort {
  final List<int>? attemptIds;
  final String? cardId;
  final bool? isSuccess;
  final DateTime? createdAt;
  final bool? includeRemoved;

  const GetAttemptListPort({
    this.attemptIds,
    this.cardId,
    this.isSuccess,
    this.createdAt,
    this.includeRemoved,
  });
}
