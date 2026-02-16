import 'package:re_save_app/api/mappers/public/item_mappers.dart';
import 'package:re_save_app/api/model/response/public/get_items_response_dto.dart';

import '../../../domain/entities/response/public/get_items_response.dart';

extension getItemResponseMappers on GetItemsResponseDto {
  GetItemsResponse toGetItemsResponse() {
    return GetItemsResponse(items: items?.map((e) => e.toItem()).toList());
  }
}
