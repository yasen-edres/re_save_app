import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/get_cart_remote_data_source.dart';
import 'package:re_save_app/domain/entities/response/get_cart_response.dart';

import '../../domain/repositories/get_cart_repository.dart';

@Injectable(as: GetCartRepository)
class GetCartRepositoryImpl implements GetCartRepository{
  final GetCartRemoteDataSource getCartRemoteDataSource;

  GetCartRepositoryImpl({required this.getCartRemoteDataSource});

  @override
  Future<GetCartResponse> getCart() {
    return getCartRemoteDataSource.geCart();
  }

}