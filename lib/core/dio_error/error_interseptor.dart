import 'package:dio/dio.dart';
import 'package:task_ms/core/constants/constants.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this.onErrorHandler);

  final Function(String) onErrorHandler;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    onErrorHandler(err.message ?? Constants.unexpectedFailureMessage);
    handler.next(err);
  }
}
