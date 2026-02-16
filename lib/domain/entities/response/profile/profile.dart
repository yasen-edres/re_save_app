class Profile {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic? emailVerifiedAt;
  final int? points;
  final String? level;
  final String? createdAt;
  final String? updatedAt;
  final String? role;
  final String? image;

  Profile({
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

  Map<String, dynamic> toJson() {
    return {
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

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
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
  }
}
