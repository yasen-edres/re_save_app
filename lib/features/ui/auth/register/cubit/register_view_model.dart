import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/register_request.dart';
import 'package:re_save_app/domain/usecases/register_use_case.dart';
import 'package:re_save_app/features/ui/auth/register/cubit/register_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/exceptions/app_exception.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  final formKey = GlobalKey<FormState>();

  RegisterViewModel(this.registerUseCase) : super(RegisterInitial());

  void register(String name, String email, String password) async {
    if (formKey.currentState?.validate() != true) return;
    emit(RegisterLoading());
    RegisterRequest registerRequest = RegisterRequest(
      name: name,
      email: email,
      password: password,
    );
    try {
      final registerResponse = await registerUseCase.invoke(registerRequest);
      String fullToken = registerResponse.token!;
      String tokenToSave = fullToken.contains('|')
          ? fullToken.split('|')[1]
          : fullToken;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', tokenToSave);
      await prefs.setBool('isLoggedIn', true);
      emit(RegisterSuccess(registerResponse: registerResponse));
    } on AppException catch (e) {
      emit(RegisterError(errorMessage: e.toString()));
    } on DioError catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'unExpected Error occurred';
      emit(RegisterError(errorMessage: message));
    }
  }
}
