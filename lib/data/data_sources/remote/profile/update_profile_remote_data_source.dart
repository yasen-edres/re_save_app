import 'package:re_save_app/domain/entities/request/profile/update_profile_request.dart';
import 'package:re_save_app/domain/entities/response/profile/update_profile_response.dart';

abstract class UpdateProfileRemoteDataSource {
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  );
}
