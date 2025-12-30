import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/update_profile_remote_data_source.dart';
import 'package:re_save_app/domain/entities/response/update_profile_response.dart';
import 'package:re_save_app/domain/repositories/update_profile_repository.dart';

import '../../domain/entities/request/update_profile_request.dart';

@Injectable(as: UpdateProfileRepository)
class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  UpdateProfileRemoteDataSource updateProfileRemoteDataSource;

  UpdateProfileRepositoryImpl({required this.updateProfileRemoteDataSource});

  @override
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  ) {
    return updateProfileRemoteDataSource.updateProfile(updateProfileRequest);
  }
}
