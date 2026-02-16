import 'package:re_save_app/domain/entities/response/profile/user.dart';


class LoginResponse {
  final String? status;
  final String? message;
  final String? token;
  final User? user;

  LoginResponse({
    this.status,
    this.message,
    this.token,
    this.user,
  });


}




