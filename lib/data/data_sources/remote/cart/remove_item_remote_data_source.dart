import 'package:re_save_app/domain/entities/response/cart/remove_item_response.dart';

abstract class RemoveItemRemoteDataSource{
  Future<RemoveItemResponse> removeItem(int itemId);
}