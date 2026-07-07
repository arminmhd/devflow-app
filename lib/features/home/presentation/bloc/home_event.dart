import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDashboardEvent extends HomeEvent {}

class LoadRecentActivityEvent extends HomeEvent {}
