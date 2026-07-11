import 'package:devflow/app/bloc/network/network_status.dart';
import 'package:equatable/equatable.dart';

class NetworkState extends Equatable {
  final NetworkStatus status;

  const NetworkState({required this.status});

  factory NetworkState.initial() {
    return NetworkState(status: NetworkStatus.unknown);
  }

  bool get isConnected => status == NetworkStatus.connected;

  @override
  List<Object?> get props => [status];
}
