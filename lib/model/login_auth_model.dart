class LoginAuthModel {
  String email;

  String password;

  LoginAuthModel({required this.email, required this.password});

  toJson() => {"email": email, "password": password};
}
