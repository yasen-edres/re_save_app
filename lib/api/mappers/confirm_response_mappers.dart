import 'package:re_save_app/api/mappers/confirmOrder_mappers.dart';
import 'package:re_save_app/api/model/response/confirm_response_dto.dart';
import 'package:re_save_app/domain/entities/response/confirm_response.dart';

extension ConfirmResponseMappers on ConfirmResponseDto{

  ConfirmResponse toConfirmResponse(){
    return ConfirmResponse(
      message: message,
      order: order?.toConfirmOrder(),
    );
  }
}