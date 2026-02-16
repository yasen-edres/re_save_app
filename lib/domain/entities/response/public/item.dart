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

  /// from JSON
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

  /// to JSON
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
