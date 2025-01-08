part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final AuthModel? auth;
  const AuthState({this.auth});
}

final class AuthInitial extends AuthState {}

final class AuthIsLoading extends AuthState {}

final class AuthIsSucces extends AuthState {
  const AuthIsSucces({super.auth});
}

final class AuthIsFailure extends AuthState {
  final String error;
  const AuthIsFailure({required this.error});
}

// currentAuthUser

final class CurrentAuthUserLoading extends AuthState {}

final class CurrentAuthUserSuccess extends AuthState {
  const CurrentAuthUserSuccess({super.auth});
}

final class CurrentAuthUserFailure extends AuthState {
  final String error;
  const CurrentAuthUserFailure({required this.error});
}
