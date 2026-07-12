import 'package:devflow/app/bloc/network/network_bloc.dart';
import 'package:devflow/app/bloc/network/network_state.dart';
import 'package:devflow/app/bloc/network/network_status.dart';
import 'package:devflow/core/services/app_snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppListeners extends StatelessWidget {
  final Widget child;

  const AppListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (state.status != NetworkStatus.connected) {
          AppMessenger.showError('You were disconnected');
        }
      },

      child: child,
    );
  }
}
