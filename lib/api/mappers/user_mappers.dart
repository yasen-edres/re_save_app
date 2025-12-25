import 'package:re_save_app/api/model/user_dto.dart';
import 'package:re_save_app/domain/entities/response/user.dart';

extension UserMappers on UserDto {
  User toUser() {
    return User(name: name, email: email);
  }
}
