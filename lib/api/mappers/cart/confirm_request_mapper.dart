import 'package:re_save_app/domain/entities/request/cart/confirm_request.dart';

import '../../model/request/cart/confirm_request_dto.dart';

extension ConfirmRequestMapper on ConfirmRequest{

  ConfirmRequestDto toConfirmRequestDto(){
    return ConfirmRequestDto(
      address: address,
    );
  }
}