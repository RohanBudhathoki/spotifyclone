part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;

  AuthSignUp({required this.email, required this.password, required this.name});
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;
  AuthLogin({required this.email, required this.password});
}

final class AuthisUserLoggedIn extends AuthEvent {}

final class AuthLogout extends AuthEvent {}

final class AuthGoogleLogin extends AuthEvent {}
