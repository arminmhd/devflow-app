import 'dart:async';

import 'package:devflow/core/network/bloc/network_event.dart';
import 'package:devflow/core/network/bloc/network_state.dart';
import 'package:devflow/core/services/connectivity_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final ConnectivityService connectivityService;
  late final StreamSubscription<bool> _subscription;

  NetworkBloc(this.connectivityService) : super(NetworkState.initial()) {
    _subscription = connectivityService.onConnectionChange.listen((
      isConnected,
    ) {
      add(NetworkStatusChanged(isConnected));
    });

    on<NetworkStatusChanged>(_onStatusChanged);
  }

  void _onStatusChanged(
    NetworkStatusChanged event,
    Emitter<NetworkState> emit,
  ) {
    emit(NetworkState(isConnected: event.isConnected));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
