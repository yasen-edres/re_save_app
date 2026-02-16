import 'package:re_save_app/domain/entities/response/profile/user_data_response.dart';

abstract class UserDataRemoteDataSource {
  Future<UserDataResponse> getUserData();
}
