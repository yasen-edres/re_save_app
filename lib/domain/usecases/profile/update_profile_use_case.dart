import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/profile/update_profile_response.dart';
import 'package:re_save_app/domain/repositories/profile/update_profile_repository.dart';

import '../../entities/request/profile/update_profile_request.dart';

@injectable
class UpdateProfileUseCase {
  UpdateProfileRepository updateProfileRepository;

  UpdateProfileUseCase({required this.updateProfileRepository});

  Future<UpdateProfileResponse> invoke(
    UpdateProfileRequest updateProfileRequest,
  ) {
    return updateProfileRepository.updateProfile(updateProfileRequest);
  }
}
