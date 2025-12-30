import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/core/exceptions/app_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../domain/entities/request/login_request.dart';
import '../../../../../domain/usecases/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  final formKey = GlobalKey<FormState>();

  LoginViewModel(this.loginUseCase) : super(LoginInitialize());

  void login(String password, String email) async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoading());
    LoginRequest loginRequest = LoginRequest(email: email, password: password);

    try {
      final loginResponse = await loginUseCase.invoke(loginRequest);
      if (loginResponse.status == 'error') {
        emit(LoginError(errorMessage: loginResponse.message!));
        return;
      }

      String fullToken = loginResponse.token!;
      String tokenToSave = fullToken.contains('|')
          ? fullToken.split('|')[1]
          : fullToken;

      final prefs = await SharedPreferences.getInstance();
      print(tokenToSave);
      await prefs.setString('token', tokenToSave);
      await prefs.setBool('isLoggedIn', true);
      print(prefs.getString('token'));

      emit(LoginSuccess(loginResponse: loginResponse));
    } on AppException catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    } on DioError catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'unExpected Error occurred';
      emit(LoginError(errorMessage: message));
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    emit(LoginInitial());
  }

  static Future<bool> checkAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}

class AuthState {}

/// view => viewModel
/// viewModel => useCase
/// useCase => repository
/// repository => object DS
/// DS => apiServices
