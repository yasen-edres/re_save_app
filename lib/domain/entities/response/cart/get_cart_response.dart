
class GetCartResponse {
  final String? status;
  final Data? data;
  final String? message;

  GetCartResponse ({
    this.status,
    this.message,
    this.data,
  });


}

class Data {
  final int? id;
  final int? userId;
  final dynamic address;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic riderId;
  final String? status;
  final String? totalQuantity;
  final int? totalPoints;
  final dynamic scheduledAt;
  final String? createdAt;
  final String? updatedAt;
  final List<Items>? items;

  Data({
    this.id,
    this.userId,
    this.address,
    this.latitude,
    this.longitude,
    this.riderId,
    this.status,
    this.totalQuantity,
    this.totalPoints,
    this.scheduledAt,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      userId: json['user_id'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      riderId: json['rider_id'],
      status: json['status'],
      totalQuantity: json['total_quantity'],
      totalPoints: json['total_points'],
      scheduledAt: json['scheduled_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      items: json['items'] != null
          ? (json['items'] as List)
          .map((e) => Items.fromJson(e))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'rider_id': riderId,
      'status': status,
      'total_quantity': totalQuantity,
      'total_points': totalPoints,
      'scheduled_at': scheduledAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'items': items?.map((e) => e.toJson()).toList(),
    };
  }
}


class Items {
  final int? id;
  final int? orderId;
  final int? itemId;
  final String? estimatedQuantity;
  final dynamic actualQuantity;
  final String? price;
  final int? pointsEarned;
  final String? createdAt;
  final String? updatedAt;
  final dynamic image;
  final Item? item;

  Items({
    this.id,
    this.orderId,
    this.itemId,
    this.estimatedQuantity,
    this.actualQuantity,
    this.price,
    this.pointsEarned,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.item,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'],
      orderId: json['order_id'],
      itemId: json['item_id'],
      estimatedQuantity: json['estimated_quantity'],
      actualQuantity: json['actual_quantity'],
      price: json['price'],
      pointsEarned: json['points_earned'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'],
      item: json['item'] != null ? Item.fromJson(json['item']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'item_id': itemId,
      'estimated_quantity': estimatedQuantity,
      'actual_quantity': actualQuantity,
      'price': price,
      'points_earned': pointsEarned,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image': image,
      'item': item?.toJson(),
    };
  }
}


class Item {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final String? pricingType;
  final String? price;
  final bool? isActive;
  final dynamic createdAt;
  final dynamic updatedAt;
  final String? category;

  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.pricingType,
    this.price,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      pricingType: json['pricing_type'],
      price: json['price'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'pricing_type': pricingType,
      'price': price,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'category': category,
    };
  }
}


