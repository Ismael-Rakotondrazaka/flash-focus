abstract class UseCase<I, O> {
  Future<O> call({
    required I input,
  });
}
