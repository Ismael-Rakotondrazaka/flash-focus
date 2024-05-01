class RepositoryFindOptions {
  final bool? includeRemoved;

  const RepositoryFindOptions({
    required this.includeRemoved,
  });
}

class RepositoryUpdateManyOptions {
  final bool? includeRemoved;

  RepositoryUpdateManyOptions({
    required this.includeRemoved,
  });
}

class RepositoryRemoveOptions {
  final bool? disableSoftDeleting;

  const RepositoryRemoveOptions({
    required this.disableSoftDeleting,
  });
}
