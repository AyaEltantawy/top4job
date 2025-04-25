import 'package:equatable/equatable.dart';

abstract class SetFingerPrintState extends Equatable {
@override
List<Object?> get props => [];
}


class SetFingerPrintStateInit extends SetFingerPrintState {}

class AuthInitial extends SetFingerPrintState {}

class AuthLoading extends SetFingerPrintState {}

class AuthSuccess extends SetFingerPrintState {}

class AuthFailure extends SetFingerPrintState {
  final String message;

  AuthFailure(this.message);
}

class BiometricState extends SetFingerPrintState {
  final bool isSupported;

  BiometricState({required this.isSupported});
}
