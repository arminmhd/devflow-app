import 'dart:async';

import 'package:devflow/app/bloc/network/network_event.dart';
import 'package:devflow/app/bloc/network/network_state.dart';
import 'package:devflow/app/bloc/network/network_status.dart';
import 'package:devflow/core/services/connectivity_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final ConnectivityService connectivityService;
  late StreamSubscription<bool> subscription;

  NetworkBloc(this.connectivityService) : super(NetworkState.initial()) {
    subscription = connectivityService.onConnectionChange.listen((
      bool connected,
    ) {
      add(
        NetworkStatusChanged(
          connected ? NetworkStatus.connected : NetworkStatus.disconnected,
        ),
      );
    });

    on<NetworkStatusChanged>(_onStatusChanged);
  }

  void _onStatusChanged(
    NetworkStatusChanged event,
    Emitter<NetworkState> emit,
  ) {
    emit(NetworkState(status: event.status));
  }

  @override
  Future<void> close() async {
    await subscription.cancel();

    return super.close();
  }
}
