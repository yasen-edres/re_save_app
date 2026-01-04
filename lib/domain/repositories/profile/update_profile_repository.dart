import 'package:re_save_app/domain/entities/response/profile/update_profile_response.dart';

import '../../entities/request/profile/update_profile_request.dart';

abstract class UpdateProfileRepository {
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRquest,
  );
}
