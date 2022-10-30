class EmptyCacheException implements Exception {}

class NoUserException implements Exception {
  final String code;
  final String message;

  const NoUserException({
    this.code = 'Authentication Error',
    this.message = 'Can\'t Create or find the user',
  });
}
