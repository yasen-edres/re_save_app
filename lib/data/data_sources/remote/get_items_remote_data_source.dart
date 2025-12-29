import 'package:re_save_app/domain/entities/response/get_items_response.dart';

abstract class GetItemsRemoteDataSource {
  Future<GetItemsResponse> getItems();
}
