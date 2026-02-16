import 'package:re_save_app/domain/entities/response/cart/confirm_response.dart';

import '../../../../domain/entities/request/cart/confirm_request.dart';

abstract class ConfirmRemoteDataSource{
  Future<ConfirmResponse> confirm(ConfirmRequest confirmRequest);
}