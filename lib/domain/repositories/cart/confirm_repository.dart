import 'package:re_save_app/domain/entities/request/cart/confirm_request.dart';
import 'package:re_save_app/domain/entities/response/cart/confirm_response.dart';

abstract class ConfirmRepository{
  Future<ConfirmResponse> confirm(ConfirmRequest conFirmRequest);
}