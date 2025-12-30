class User {
  final String? name;
  final String? email;
  final dynamic phone;
  final String? image;
  final int? points;
  final String? level;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  User({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.level,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  /// from json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      level: json['level'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  /// to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'points': points,
      'level': level,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
