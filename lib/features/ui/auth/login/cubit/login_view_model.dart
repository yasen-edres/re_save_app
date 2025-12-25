import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/core/exceptions/app_exception.dart';

import '../../../../../domain/entities/request/login_request.dart';
import '../../../../../domain/usecases/login_use_case.dart';
import '../../auth_state.dart';

@injectable
class LoginViewModel extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final formKey = GlobalKey<FormState>();

  LoginViewModel(this.loginUseCase) : super(AuthLoading());

  void login(String password, String email) async {
    if (!formKey.currentState!.validate()) return;
    emit(AuthLoading());
    LoginRequest loginRequest = LoginRequest(email: email, password: password);

    try {
      final loginResponse = await loginUseCase.invoke(loginRequest);
      emit(AuthSuccess(loginResponse: loginResponse));
    } on AppException catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    } on DioError catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'unExpected Error occurred';
      emit(AuthError(errorMessage: message));
    }
  }
}

/// view => viewModel
/// viewModel => useCase
/// useCase => repository
/// repository => object DS
/// DS => apiServices
