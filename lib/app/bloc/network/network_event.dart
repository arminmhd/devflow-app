import 'package:devflow/app/bloc/network/network_status.dart';
import 'package:equatable/equatable.dart';

abstract class NetworkEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class NetworkStatusChanged extends NetworkEvent {
  final NetworkStatus status;

  NetworkStatusChanged(this.status);

  @override
  List<Object?> get props => [status];
}
