import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:devflow/app/bloc/network/network_status.dart';

class ConnectivityService {
  final Connectivity connectivity;

  ConnectivityService(this.connectivity);

  Future<NetworkStatus> checkConnection() async {
    final result = await connectivity.checkConnectivity();

    return _mapStatus(result);
  }

  Stream<NetworkStatus> get onConnectionChange {
    return connectivity.onConnectivityChanged.map(_mapStatus);
  }

  NetworkStatus _mapStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      return NetworkStatus.disconnected;
    }

    return NetworkStatus.connected;
  }
}
