import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/update_profile_response.dart';
import 'package:re_save_app/domain/repositories/update_profile_repository.dart';

import '../entities/request/update_profile_request.dart';

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
