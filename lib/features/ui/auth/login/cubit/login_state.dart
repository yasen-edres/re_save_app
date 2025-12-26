import 'package:re_save_app/domain/entities/response/login_response.dart';

abstract class LoginState {}

class LoginLoading extends LoginState {}

class LoginInitialize extends LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  LoginResponse loginResponse;

  LoginSuccess({required this.loginResponse});
}

class LoginError extends LoginState {
  String errorMessage;

  LoginError({required this.errorMessage});
}
