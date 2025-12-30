import 'package:re_save_app/domain/entities/response/confirm_response.dart';

import '../../../domain/entities/request/confirm_request.dart';

abstract class ConfirmRemoteDataSource{
  Future<ConfirmResponse> confirm(ConfirmRequest confirmRequest);
}