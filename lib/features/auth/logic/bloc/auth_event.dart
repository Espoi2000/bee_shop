part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final AuthLoginModel authLoginModel;
  LoginEvent({required this.authLoginModel});
}

class GetCurrentUserEvent extends AuthEvent {}