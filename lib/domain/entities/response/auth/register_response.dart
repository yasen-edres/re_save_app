
import 'package:re_save_app/domain/entities/response/profile/user.dart';

class RegisterResponse {
  final String? status;
  final String? message;
  final String? token;
  final User? user;

  RegisterResponse ({
    this.status,
    this.message,
    this.token,
    this.user,
  });


}




