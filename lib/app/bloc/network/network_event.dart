import 'package:devflow/app/bloc/network/network_status.dart';
import 'package:equatable/equatable.dart';

sealed class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object?> get props => [];
}

final class NetworkStatusChanged extends NetworkEvent {
  final NetworkStatus status;

  const NetworkStatusChanged(this.status);

  @override
  List<Object?> get props => [status];
}
