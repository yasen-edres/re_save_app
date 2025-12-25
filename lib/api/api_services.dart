import 'package:dio/dio.dart';
import 'package:re_save_app/api/end_points.dart';
import 'package:re_save_app/api/model/request/login_request_dto.dart';

import 'model/response/login_response_dto.dart';

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
}
