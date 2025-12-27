import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/mappers/update_profile_request_mappers.dart';
import 'package:re_save_app/api/mappers/update_profile_response_mappers.dart';
import 'package:re_save_app/domain/entities/request/update_profile_request.dart';
import 'package:re_save_app/domain/entities/response/update_profile_response.dart';

import '../../../../data/data_sources/remote/update_profile_remote_data_source.dart';
import '../../../api_services.dart';

@Injectable(as: UpdateProfileRemoteDataSource)
class UpdateProfileRemoteDataSourceImpl
    implements UpdateProfileRemoteDataSource {
  ApiServices apiServices;

  UpdateProfileRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  ) async {
    var updateProfileResponse = await apiServices.updateProfile(
      updateProfileRequestDto: updateProfileRequest.toUpdateProfileRequestDto(),
    );
    return updateProfileResponse.toUpdateProfileResponse();
  }
}
