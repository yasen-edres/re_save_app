import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/profile/change_password_request.dart';
import 'package:re_save_app/domain/entities/response/profile/change_password_response.dart';
import 'package:re_save_app/domain/repositories/profile/change_password_repository.dart';

@Injectable()
class ChangePasswordUseCase {
  final ChangePasswordRepository changePasswordRepository;

  ChangePasswordUseCase({required this.changePasswordRepository});

  Future<ChangePasswordResponse> invoke(
    ChangePasswordRequest changePasswordRequest,
  ) {
    return changePasswordRepository.changePassword(changePasswordRequest);
  }
}
