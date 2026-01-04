class CartItem {
  final int? orderId;
  final int? itemId;
  final int? estimatedQuantity;
  final String? price;
  final int? pointsEarned;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  CartItem({
    this.orderId,
    this.itemId,
    this.estimatedQuantity,
    this.price,
    this.pointsEarned,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      orderId: json['orderId'] as int?,
      itemId: json['itemId'] as int?,
      estimatedQuantity: json['estimatedQuantity'] as int?,
      price: json['price'] as String?,
      pointsEarned: json['pointsEarned'] as int?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      id: json['id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'itemId': itemId,
      'estimatedQuantity': estimatedQuantity,
      'price': price,
      'pointsEarned': pointsEarned,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'id': id,
    };
  }
}
