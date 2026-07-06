import 'package:dio/dio.dart';

class RetryQueueService {
  final List<RequestOptions> _queue = [];

  void add(RequestOptions request) {
    _queue.add(request);
  }

  List<RequestOptions> get pendingRequest => List.unmodifiable(_queue);

  void clear() {
    _queue.clear();
  }
}
