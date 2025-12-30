import 'package:re_save_app/domain/entities/request/confirm_request.dart';

import '../model/request/confirm_request_dto.dart';

extension ConfirmRequestMapper on ConfirmRequest{

  ConfirmRequestDto toConfirmRequestDto(){
    return ConfirmRequestDto(
      address: address,
    );
  }
}