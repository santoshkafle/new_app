import 'package:flutter/material.dart';
import 'package:new_app/auth/services/local_storages.dart';
import 'package:new_app/model/user_model.dart';
import 'package:new_app/utils/regex_extension.dart';

class FormProvider with ChangeNotifier {
  late UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<void> registerUserData({
    required userName,
    required email,
    required password,
    required phoneNumber,
  }) async {
    if (userName == null &&
        email == null &&
        password == null &&
        phoneNumber == null)
      return;
    _userModel = UserModel(
      userId: "1",
      userName: userName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );

    await LocalStorages.saveUserData(_userModel!);

    notifyListeners();
  }

  //this function to check and validate form..... also save and naviagete to homepage....
  Future<void> initilizeUserModel() async {
    _userModel = await LocalStorages.loadUserData();
    notifyListeners();
  }

  //below method is to check userinput text is in correct pattern or not....
  String? emailCorrection(String? email) {
    if (email == '' || email == null) {
      return 'Email cannot be empty'; //we are passing the error here
    } else if (!email.isValidEmail) {
      return "Email Does not Match";
    } else {
      return null; //this means no error as occured
    }
  }

  String? userNameCorrection(String? username) {
    if (username == '' || username == null) {
      return 'Username cannot be empty'; //we are passing the error here
    } else if (!username.isValidName) {
      return "Username Does not Match";
    } else {
      return null; //this means no error as occured
    }
  }

  String? passwordCorrection(String? password) {
    if (password == '' || password == null) {
      return 'Password cannot be empty'; //we are passing the error here
    } else if (!password.isValidPassword) {
      return "Password Does not Match";
    } else {
      return null; //this means no error as occured
    }
  }

  String? phNumberCorrection(String? num) {
    if (num == '' || num == null) {
      return 'Number cannot be empty'; //we are passing the error here
    } else if (!num.isValidPhone) {
      return "Number Does not Match";
    } else {
      return null; //this means no error as occured
    }
  }
}
