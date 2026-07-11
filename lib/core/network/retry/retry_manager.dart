import 'package:devflow/core/services/retry_queue_service.dart';
import 'package:dio/dio.dart';

class RetryManager {
  final Dio dio;
  final RetryQueueService queue;

  RetryManager(this.dio, this.queue);

  Future<void> retry() async {
    for (final request in queue.pendingRequest) {
      dio.fetch(request);
    }

    queue.clear();
  }
}
