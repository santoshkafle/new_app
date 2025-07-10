import 'package:flutter/material.dart';
import 'package:new_app/auth/models/auth_model.dart';
import 'package:new_app/auth/services/auth_api_services.dart';
import 'package:new_app/auth/services/local_storages.dart';
import 'package:new_app/utils/regex_extension.dart';

class FormProvider with ChangeNotifier {
  late AuthModel? _authModel;
  AuthModel? get authModel => _authModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> registerUserData({
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
  }) async {
    _isLoading = true;
    notifyListeners();

    AuthModel authModel = AuthModel(
      fullName: userName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    await AuthApiServices.createUser(authModel);
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> logInUser({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    final _usersList = await AuthApiServices.getUsers();
    final bool isAuthorized = _usersList.any(
      (e) => e.email == email && e.password == password,
    );
    late final AuthModel _user;

    if (isAuthorized) {
      _user = _usersList.firstWhere(
        (e) => e.email == email && e.password == password,
      );
      LocalStorages.saveUserData(_user);
      LocalStorages.setUserLoggedIn();

      //also initilize are while loging to load user data and navigate, so that can be disply on
      // profile
      initilizeAuthModel();

      _isLoading = false;
      notifyListeners();

      return true;
    } else {
      _isLoading = false;
      notifyListeners();

      return false;
    }
  }

  //this function to check and validate form..... also save and naviagete to homepage....
  Future<void> initilizeAuthModel() async {
    _authModel = await LocalStorages.loadUserData();
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
