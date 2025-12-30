import 'package:re_save_app/domain/entities/response/update_profile_response.dart';

import '../entities/request/update_profile_request.dart';

abstract class UpdateProfileRepository {
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRquest,
  );
}
