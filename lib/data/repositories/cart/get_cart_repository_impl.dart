import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/cart/get_cart_remote_data_source.dart';
import 'package:re_save_app/domain/entities/response/cart/get_cart_response.dart';

import '../../../domain/repositories/cart/get_cart_repository.dart';

@Injectable(as: GetCartRepository)
class GetCartRepositoryImpl implements GetCartRepository{
  final GetCartRemoteDataSource getCartRemoteDataSource;

  GetCartRepositoryImpl({required this.getCartRemoteDataSource});

  @override
  Future<GetCartResponse> getCart() {
    return getCartRemoteDataSource.geCart();
  }

}