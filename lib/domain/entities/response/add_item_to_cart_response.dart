

import 'cart_item.dart';

class AddItemToCartResponse {
  final String? status;
  final String? message;
  final CartItem? cartItem;

  AddItemToCartResponse ({
    this.status,
    this.message,
    this.cartItem,
  });

}




