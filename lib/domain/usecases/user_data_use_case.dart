import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/user_data_response.dart';

import '../repositories/user_data_repository.dart';

@injectable
class UserDataUseCase {
  UserDataRepository userDataRepository;

  UserDataUseCase({required this.userDataRepository});

  Future<UserDataResponse> invoke() {
    return userDataRepository.getUserData();
  }
}
