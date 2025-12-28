import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/change_password_request_mappers.dart';
import 'package:re_save_app/domain/entities/request/change_password_request.dart';
import 'package:re_save_app/domain/entities/response/change_password_response.dart';

import '../../../../data/data_sources/remote/change_password_remote_data_source.dart';

@Injectable(as: ChangePasswordRemoteDataSource)
class ChangePasswordRemoteDataSourceImpl
    implements ChangePasswordRemoteDataSource {
  ApiServices apiServices;

  ChangePasswordRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    var changePasswordResponse = await apiServices.changePassword(
      changePasswordRequest.toChangePasswordRequestDto(),
    );
    return changePasswordResponse.toChangePasswordResponse();
  }
}
