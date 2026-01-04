import 'package:re_save_app/domain/entities/response/profile/profile.dart';

class UpdateProfileResponse {
  final String? message;
  final Profile? profile;

  UpdateProfileResponse({this.message, this.profile});
}
