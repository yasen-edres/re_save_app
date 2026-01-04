import 'package:re_save_app/api/model/response/cart/remove_item_response_dto.dart';

import '../../../domain/entities/response/cart/remove_item_response.dart';

extension RemoveItemMappers on RemoveItemResponseDto{

  RemoveItemResponse toRemoveItemResponse(){
    return RemoveItemResponse(
      message: message
    );
  }
}