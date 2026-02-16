import 'package:re_save_app/domain/entities/response/cart/get_cart_response.dart';

abstract class GetCartRemoteDataSource{
  Future<GetCartResponse> geCart();
}