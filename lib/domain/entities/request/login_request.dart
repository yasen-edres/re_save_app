

class LoginRequest {
  final String? email;
  final String? password;

  LoginRequest({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
