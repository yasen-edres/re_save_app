import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/mappers/auth/user_response_mappers.dart';
import 'package:re_save_app/domain/entities/response/profile/user_data_response.dart';

import '../../../../data/data_sources/remote/profile/user_data_remote_data_source.dart';
import '../../../api_services.dart';

@Injectable(as: UserDataRemoteDataSource)
class UserDataRemoteDataSourceImpl implements UserDataRemoteDataSource {
  ApiServices apiServices;

  UserDataRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UserDataResponse> getUserData() async {
    var userDataResponse = await apiServices.getUserData();

    return userDataResponse.toUserDataResponse();
  }
}
