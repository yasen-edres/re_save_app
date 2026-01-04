import 'package:re_save_app/domain/entities/request/cart/update_item_request.dart';
import 'package:re_save_app/domain/entities/response/cart/update_item_response.dart';

abstract class UpdateItemRepository{
  Future<UpdateItemResponse> updateItem(UpdateItemRequest updateItemRequest, int itemId);
}