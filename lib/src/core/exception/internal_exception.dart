class InternalException<T> implements Exception {
  final String message;
  final String? description;
  final T data;

  const InternalException({
    required this.message,
    this.description,
    required this.data,
  });
}
