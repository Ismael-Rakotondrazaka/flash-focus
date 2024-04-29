import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Attempt extends Equatable {
  final int id;
  final String cardId;
  final bool isSuccess;
  final DateTime createdAt;
  final DateTime? deletedAt;

  const Attempt({
    required this.id,
    required this.cardId,
    required this.isSuccess,
    required this.createdAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        cardId,
        isSuccess,
        createdAt,
        deletedAt,
      ];
}
