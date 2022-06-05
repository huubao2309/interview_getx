class ServerException implements Exception {
  ServerException({
    this.errorMessage,
    this.statusCode,
  });

  final String? errorMessage;
  final int? statusCode;
}

class CacheException implements Exception {}
