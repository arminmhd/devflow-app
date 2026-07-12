import 'package:devflow/app/bloc/network/network_status.dart';
import 'package:equatable/equatable.dart';

class NetworkState extends Equatable {
  final NetworkStatus status;

  const NetworkState({required this.status});

  factory NetworkState.initial() {
    return const NetworkState(status: NetworkStatus.unknown);
  }

  bool get isOnline => status == NetworkStatus.connected;

  NetworkState copyWith({NetworkStatus? status}) {
    return NetworkState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
