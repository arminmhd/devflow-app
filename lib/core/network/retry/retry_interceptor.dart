import 'package:devflow/core/services/retry_queue_service.dart';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final RetryQueueService retryQueueService;

  RetryInterceptor(this.retryQueueService);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown) {
      retryQueueService.add(err.requestOptions);
    }

    handler.next(err);
  }
}
