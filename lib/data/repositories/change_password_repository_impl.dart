import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/change_password_remote_data_source.dart';
import 'package:re_save_app/domain/entities/request/change_password_request.dart';
import 'package:re_save_app/domain/entities/response/change_password_response.dart';

import '../../domain/repositories/change_password_repository.dart';

@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  ChangePasswordRemoteDataSource changePasswordRemoteDataSource;

  ChangePasswordRepositoryImpl({required this.changePasswordRemoteDataSource});

  @override
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) {
    return changePasswordRemoteDataSource.changePassword(changePasswordRequest);
  }
}
