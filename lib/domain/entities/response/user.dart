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

  User toEntity() => User(id: id, name: name, email: email, role: role);
}
