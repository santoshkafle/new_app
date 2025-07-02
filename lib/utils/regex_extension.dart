extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(
      r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$",
    );
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidZipCode {
    final zipCodeRegExp = RegExp(r"^\d{5}(?:[-\s]\d{4})?$");
    return zipCodeRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(
      r"^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$",
    );
    return phoneRegExp.hasMatch(this);
  }
}
