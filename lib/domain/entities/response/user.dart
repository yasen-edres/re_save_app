class User {
  final int? id;
  final String? name;
  final String? email;
  final dynamic? phone;
  final dynamic? emailVerifiedAt;
  final int? points;
  final String? level;
  final String? createdAt;
  final String? updatedAt;
  final String? role;
  final dynamic? image;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.points,
    this.level,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    emailVerifiedAt: json['email_verified_at'],
    points: json['points'],
    level: json['level'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    role: json['role'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'email_verified_at': emailVerifiedAt,
    'points': points,
    'level': level,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'role': role,
    'image': image,
  };
}