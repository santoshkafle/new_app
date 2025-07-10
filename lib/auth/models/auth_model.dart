class AuthModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;

  AuthModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  factory AuthModel.formJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json["id"],
      fullName: json["fullName"],
      email: json["email"],
      password: json["password"],
      phoneNumber: json["phoneNumber"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": "",
      "fullName": fullName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
    };
  }
}
