abstract class AppException implements Exception {
  String errorMessage;
  int? statusCode;

  AppException({required this.errorMessage, this.statusCode});
}

class ServerException extends AppException {
  ServerException({required super.errorMessage, super.statusCode});
}

class NetworkException extends AppException {
  NetworkException({required super.errorMessage, super.statusCode});
}

class UnExpectedException extends AppException {
  UnExpectedException({required super.errorMessage});
}
