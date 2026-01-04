import 'package:re_save_app/domain/entities/response/public/get_items_response.dart';

abstract class GetItemsRepository {
  Future<GetItemsResponse> getItems();
}
