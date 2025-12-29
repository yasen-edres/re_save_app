import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/add_item_to_cart_remote_data_source.dart';
import 'package:re_save_app/domain/entities/request/add_item_to_cart_request.dart';
import 'package:re_save_app/domain/entities/response/add_item_to_cart_response.dart';

import '../../domain/repositories/add_item_to_cart_repository.dart';

@Injectable(as: AddItemToCartRepository)
class AddItemToCartRepositoryImpl implements AddItemToCartRepository{
  AddItemToCartRemoteDataSource addItemToCartRemoteDataSource;

  AddItemToCartRepositoryImpl({required this.addItemToCartRemoteDataSource});

  @override
  Future<AddItemToCartResponse> addItemToCart(AddItemToCartRequest addItemToCartRequest) {
    return addItemToCartRemoteDataSource.addItemToCart(addItemToCartRequest);
  }

}