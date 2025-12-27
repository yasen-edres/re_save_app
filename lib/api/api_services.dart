import 'package:dio/dio.dart';
import 'package:re_save_app/api/end_points.dart';
import 'package:re_save_app/api/model/request/login_request_dto.dart';
import 'package:re_save_app/api/model/response/register_response_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/request/register_request_dto.dart';
import 'model/request/updata_profile_request_dto.dart';
import 'model/response/login_response_dto.dart';
import 'model/response/update_profile_response_dto.dart';
import 'model/response/user_data_response_dto.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

  Future<LoginResponseDto> login({
    required LoginRequestDto loginRequest,
  }) async {
    final response = await dio.post(
      EndPoints.loginEndPoint,
      data: loginRequest.toJson(),
    );
    return LoginResponseDto.fromJson(response.data);
  }

  Future<RegisterResponseDto> register(
      {required RegisterRequestDto registerRequestDto}) async {
    final response = await dio.post(
      EndPoints.registerEndPoint,
      data: registerRequestDto.toJson(),
    );
    return RegisterResponseDto.fromJson(response.data);
  }

  Future<UserDataResponseDto> getUserData() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }
    final response = await dio.get(
        EndPoints.profileDataEndPoint,
        options: Options(
            headers: {
              'Authorization': 'Bearer ${token}'
            }
        )

    );
    return UserDataResponseDto.fromJson(response.data);
  }

  Future<UpdateProfileResponseDto> updateProfile(
      {required UpdateProfileRequestDto updateProfileRequestDto}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }
    final response = await dio.put(
      EndPoints.updateProfileEndPoint,
      data: updateProfileRequestDto.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return UpdateProfileResponseDto.fromJson(response.data);
  }
}
