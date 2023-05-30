import 'package:equatable/equatable.dart';

sealed class ControllerState extends Equatable {
  const ControllerState();

  @override
  List<Object?> get props => [];
}

class InitialState extends ControllerState {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class SuccessState extends ControllerState {
  const SuccessState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends ControllerState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class ErrorState extends ControllerState {
  final String message;

  const ErrorState(this.message);

  @override
  List<String> get props => [message];
}
