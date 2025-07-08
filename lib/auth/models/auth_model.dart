class AuthModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNo;

  AuthModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNo,
  });

  factory AuthModel.formJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json["id"],
      fullName: json["fullName"],
      email: json["email"],
      password: json["password"],
      phoneNo: json["phoneNo"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": "",
      "fullName": fullName,
      "email": email,
      "password": password,
      "phoneNo": phoneNo,
    };
  }
}
