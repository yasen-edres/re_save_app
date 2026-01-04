import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/cart/update_item_mappers.dart';
import 'package:re_save_app/api/mappers/cart/update_item_response_mappers.dart';
import 'package:re_save_app/domain/entities/request/cart/update_item_request.dart';
import 'package:re_save_app/domain/entities/response/cart/update_item_response.dart';

import '../../../../data/data_sources/remote/cart/update_item_remote_data_source.dart';

@Injectable(as:UpdateItemRemoteDataSource )
class UpdateItemRemoteDataSourceImpl implements UpdateItemRemoteDataSource{
  ApiServices apiServices;

  UpdateItemRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateItemResponse> updateItem(UpdateItemRequest updateItemRequest, int itemId) async{
    final response =await apiServices.updateItem(
        updateItemRequest.toUpdateItemRequestDto(),
        itemId,
    );
    return response.toUpdateItemResponse();
  }

}

