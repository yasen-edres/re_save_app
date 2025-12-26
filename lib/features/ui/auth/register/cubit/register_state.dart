import '../../../../../domain/entities/response/register_response.dart';

abstract class RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterInitialize extends RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterResponse registerResponse;

  RegisterSuccess({required this.registerResponse});
}

class RegisterError extends RegisterState {
  String errorMessage;

  RegisterError({required this.errorMessage});
}
