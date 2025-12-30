import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/auth_request_mappers.dart';
import 'package:re_save_app/api/mappers/auth_response_mappers.dart';
import 'package:re_save_app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:re_save_app/domain/entities/request/login_request.dart';
import 'package:re_save_app/domain/entities/request/register_request.dart';
import 'package:re_save_app/domain/entities/response/register_response.dart';

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

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    //todo: registerRequest => registerRequestDto
    var registerResponse = await apiServices.register(
        registerRequestDto: registerRequest.toRegisterRequestDto()
    );
    //todo:
    return registerResponse.toRegisterResponse();
  }
}
