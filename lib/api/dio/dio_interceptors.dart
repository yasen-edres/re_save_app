import 'package:dio/dio.dart';

import '../../core/exceptions/app_exception.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppException exception;

    String message = 'Something went wrong';

    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.other) {
      exception = NetworkException(errorMessage: 'No internet connection');
    } else if (err.response?.statusCode != null) {
      exception = ServerException(
        errorMessage: message,
        statusCode: err.response?.statusCode,
      );
    } else {
      exception = UnExpectedException(errorMessage: message);
    }

    handler.next(
      DioError(requestOptions: err.requestOptions, error: exception),
    );
  }
}
