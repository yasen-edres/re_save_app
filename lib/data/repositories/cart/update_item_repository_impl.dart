import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/cart/update_item_remote_data_source.dart';
import 'package:re_save_app/domain/entities/request/cart/update_item_request.dart';
import 'package:re_save_app/domain/entities/response/cart/update_item_response.dart';

import '../../../domain/repositories/cart/update_item_repository.dart';

@Injectable(as: UpdateItemRepository)
class UpdateItemRepositoryImpl implements UpdateItemRepository{
  UpdateItemRemoteDataSource updateItemRemoteDataSource;

  UpdateItemRepositoryImpl({required this.updateItemRemoteDataSource});

  @override
  Future<UpdateItemResponse> updateItem(UpdateItemRequest updateItemRequest,int itemId) {
    return updateItemRemoteDataSource.updateItem(updateItemRequest,itemId);
  }

}