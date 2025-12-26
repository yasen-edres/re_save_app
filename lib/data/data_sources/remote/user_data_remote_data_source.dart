import 'package:re_save_app/domain/entities/response/user_data_response.dart';

abstract class UserDataRemoteDataSource {
  Future<UserDataResponse> getUserData();
}
