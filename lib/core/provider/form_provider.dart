import '../../commons/models/validation_login_form.dart';
import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _phone = ValidationModel(null, null);
  ValidationModel _name = ValidationModel(null, null);

  ValidationModel get email => _email;

  ValidationModel get password => _password;

  ValidationModel get phone => _phone;

  ValidationModel get name => _name;

  void validateEmail(String val) {
    if (val.isValidEmail) {
      _email = ValidationModel(val, null);
    } else {
      _email = ValidationModel(null, 'Please Enter a Valid Email');
    }

    notifyListeners();
  }

  void validatePassword(String val) {
    print(val);
    if (val.isValidPassword) {
      _password = ValidationModel(val, null);
    } else {
      _password = ValidationModel(null,
          'Password must contain an uppercase, lowercase, numeric digit and special character');
    }
    notifyListeners();
  }

  void validateName(String val) {
    if (val.isValidName) {
      _name = ValidationModel(val, null);
    } else {
      _name = ValidationModel(null, 'Please enter a valid name');
    }

    notifyListeners();
  }

  void validatePhone(String val) {
    if (val.isValidPhone) {
      _phone = ValidationModel(val, null);
    } else {
      _phone = ValidationModel(null, 'Phone Number must be up to 11 digits');
    }
    notifyListeners();
  }

  bool get validate {
    if (_email.value.isNotNull &&
        _password.value.isNotNull &&
        _phone.value.isNotNull &&
        _name.value.isNotNull) {
      return true;
    } else {
      return false;
    }
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
