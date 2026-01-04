import 'package:dio/dio.dart';
import 'package:re_save_app/api/end_points.dart';
import 'package:re_save_app/api/model/request/auth/login_request_dto.dart';
import 'package:re_save_app/api/model/request/cart/add_item_to_cart_request_dto.dart';
import 'package:re_save_app/api/model/request/cart/update_item_request_dto.dart';
import 'package:re_save_app/api/model/response/auth/register_response_dto.dart';
import 'package:re_save_app/api/model/response/cart/add_item_to_cart_response_dto.dart';
import 'package:re_save_app/api/model/response/cart/confirm_response_dto.dart';
import 'package:re_save_app/api/model/response/cart/get_cart_response_dto.dart';
import 'package:re_save_app/api/model/response/cart/remove_item_response_dto.dart';
import 'package:re_save_app/api/model/response/cart/update_item_response_dto.dart';
import 'package:re_save_app/api/model/response/profile/change_password_response_dto.dart';
import 'package:re_save_app/api/model/response/public/get_items_response_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/request/auth/register_request_dto.dart';
import 'model/request/cart/confirm_request_dto.dart';
import 'model/request/profile/change_password_request_dto.dart';
import 'model/request/profile/updata_profile_request_dto.dart';
import 'model/response/auth/login_response_dto.dart';
import 'model/response/auth/user_data_response_dto.dart';
import 'model/response/profile/update_profile_response_dto.dart';

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


  Future<ChangePasswordResponseDto> changePassword(
    ChangePasswordRequestDto changePasswordRequestDto,
  ) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }
    final response = await dio.put(
      EndPoints.changePasswordEndPoint,
      data: changePasswordRequestDto.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return ChangePasswordResponseDto.fromJson(response.data);
  }


  Future<GetItemsResponseDto> getItems() async {
    final response = await dio.get(EndPoints.getItemsEndPoint);
    return GetItemsResponseDto.fromJson(response.data);
  }
  Future<AddItemToCartResponseDto> addItemToCart(AddItemToCartRequestDto addItemToCartRequestDto) async{
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }
    final response = await dio.post(
      EndPoints.addItemToCartEndPoint,
      data: addItemToCartRequestDto.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return AddItemToCartResponseDto.fromJson(response.data);
  }

  Future<GetCartResponseDto> getCart()async{
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }
    final response = await dio.get(
      EndPoints.getCartEndPoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        }
      )
    );
    return GetCartResponseDto.fromJson(response.data);
  }

  Future<RemoveItemResponseDto> removeItem(int itemId) async{
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }
    final response = await dio.delete(
        '${EndPoints.removeItemEndPoint}/$itemId',
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            }
        )
    );
    return RemoveItemResponseDto.fromJson(response.data);

  }

  Future<UpdateItemResponseDto> updateItem(UpdateItemRequestDto updateItemRequestDto, int itemId) async{
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }

    final response = await dio.put(
      '${EndPoints.updateItemEndPoint}/$itemId',
        data: updateItemRequestDto.toJson(),
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            }
        )
    );
    return UpdateItemResponseDto.fromJson(response.data);
  }
  Future<ConfirmResponseDto> confirm(ConfirmRequestDto confirmRequestDto) async{
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }
    final response = await dio.post(
      EndPoints.confirmEndPoint,
        data: confirmRequestDto.toJson(),
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            }
        )
    );
    return ConfirmResponseDto.fromJson(response.data);
  }

}
