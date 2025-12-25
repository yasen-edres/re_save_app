import 'package:re_save_app/domain/entities/response/login_response.dart';

abstract class AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  LoginResponse loginResponse;

  AuthSuccess({required this.loginResponse});
}

class AuthError extends AuthState {
  String errorMessage;

  AuthError({required this.errorMessage});
}
