import 'package:json_annotation/json_annotation.dart';
import 'package:re_save_app/domain/entities/response/user.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String? message;
  final String? token;
  final User? user;

  RegisterResponse({this.message, this.token, this.user});
}
