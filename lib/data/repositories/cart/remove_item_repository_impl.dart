import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/cart/remove_item_remote_data_source.dart';
import 'package:re_save_app/domain/entities/response/cart/remove_item_response.dart';

import '../../../domain/repositories/cart/remove_item_respository.dart';

@Injectable(as:RemoveItemRepository )
class RemoveItemRepositoryImpl implements RemoveItemRepository{
  RemoveItemRemoteDataSource removeItemRemoteDataSource;
  RemoveItemRepositoryImpl({required this.removeItemRemoteDataSource});

  @override
  Future<RemoveItemResponse> removeItem(int itemId) {
    return removeItemRemoteDataSource.removeItem(itemId);
  }

}