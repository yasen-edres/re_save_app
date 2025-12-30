import 'package:re_save_app/domain/entities/request/confirm_request.dart';
import 'package:re_save_app/domain/entities/response/confirm_response.dart';

abstract class ConfirmRepository{
  Future<ConfirmResponse> confirm(ConfirmRequest conFirmRequest);
}