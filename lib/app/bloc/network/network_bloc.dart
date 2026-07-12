import 'dart:async';

import 'package:devflow/app/bloc/network/network_event.dart';
import 'package:devflow/app/bloc/network/network_state.dart';
import 'package:devflow/app/bloc/network/network_status.dart';
import 'package:devflow/core/services/connectivity_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final ConnectivityService connectivityService;

  StreamSubscription<NetworkStatus>? _subscription;

  NetworkBloc(this.connectivityService) : super(NetworkState.initial()) {
    on<NetworkStatusChanged>(_onStatusChanged);

    _listenConnectionChanges();
  }

  void _listenConnectionChanges() {
    _subscription = connectivityService.onConnectionChange.listen((status) {
      add(NetworkStatusChanged(status));
    });
  }

  void _onStatusChanged(
    NetworkStatusChanged event,
    Emitter<NetworkState> emit,
  ) {
    emit(state.copyWith(status: event.status));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();

    return super.close();
  }
}
