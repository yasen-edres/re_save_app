import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/user_data_remote_data_source.dart';
import 'package:re_save_app/domain/entities/response/user_data_response.dart';
import 'package:re_save_app/domain/repositories/user_data_repository.dart';

@Injectable(as: UserDataRepository)
class UserDataRepositoryImpl implements UserDataRepository {
  final UserDataRemoteDataSource userDataRemoteDataSource;

  UserDataRepositoryImpl({required this.userDataRemoteDataSource});

  @override
  Future<UserDataResponse> getUserData() {
    return userDataRemoteDataSource.getUserData();
  }
}
