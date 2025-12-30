import 'package:re_save_app/api/model/request/update_item_request_dto.dart';
import 'package:re_save_app/domain/entities/request/update_item_request.dart';

extension UpdateItemMappers on UpdateItemRequest{
  UpdateItemRequestDto toUpdateItemRequestDto(){
    return UpdateItemRequestDto(
      estimatedQuantity: estimatedQuantity
    );
  }
}