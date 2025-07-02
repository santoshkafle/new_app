class UserModel {
  final String userId;
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;

  UserModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userid"],
      userName: json["username"],
      email: json["email"],
      password: json["password"],
      phoneNumber: json["phonenumber"],
    );
  }

  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      "userid": userModel.userId,
      "username": userModel.userName,
      "email": userModel.email,
      "password": userModel.password,
      "phonenumber": userModel.phoneNumber,
    };
  }
}
