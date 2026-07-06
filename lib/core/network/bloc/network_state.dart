import 'package:equatable/equatable.dart';

class NetworkState extends Equatable {
  final bool isConnected;

  const NetworkState({required this.isConnected});

  factory NetworkState.initial() => const NetworkState(isConnected: true);

  @override
  List<Object?> get props => [isConnected];
}
