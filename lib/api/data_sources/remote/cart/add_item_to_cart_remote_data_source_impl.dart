import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/add_item_to_cart_request_mappers.dart';
import 'package:re_save_app/api/mappers/add_item_to_cart_response_mappers.dart';
import 'package:re_save_app/domain/entities/request/add_item_to_cart_request.dart';
import 'package:re_save_app/domain/entities/response/add_item_to_cart_response.dart';

import '../../../../data/data_sources/remote/add_item_to_cart_remote_data_source.dart';

@Injectable(as:AddItemToCartRemoteDataSource )
class AddItemToCartRemoteDataSourceImpl implements AddItemToCartRemoteDataSource{
  ApiServices apiServices;

  AddItemToCartRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddItemToCartResponse> addItemToCart(AddItemToCartRequest addItemToCartRequest) async{
    //todo: addItemToCartRequest => addItemToCartRequestDto
    final response = await apiServices.addItemToCart(addItemToCartRequest.toAddItemToCartRequestDto());
    //todo: addItemToCartResponseDto => addItemToCartResponse.

    return response.toAddItemToCartResponse();

  }

}