import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/login_request_mappers.dart';
import 'package:re_save_app/api/mappers/login_response_mappers.dart';
import 'package:re_save_app/data/data_sources/auth_remote_data_source.dart';
import 'package:re_save_app/domain/entities/request/login_request.dart';

import '../../../../domain/entities/response/login_response.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiServices apiServices;

  AuthRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    //todo:loginRequest => loginRequestDto
    var loginResponse = await apiServices.login(
      loginRequest: loginRequest.toLoginRequestDto(),
    );
    //todo: loginResponseDto => AuthResponse
    return loginResponse.toLoginResponse();
  }
}
