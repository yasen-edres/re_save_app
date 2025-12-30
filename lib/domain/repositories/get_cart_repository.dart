import 'package:re_save_app/domain/entities/response/get_cart_response.dart';

abstract class GetCartRepository{
  Future<GetCartResponse> getCart();
}