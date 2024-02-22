import 'package:wedding/core/modules/alert/manager.dart';

class AuthManager {
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    AlertManager.instance.showSnack(SnackType.error, message: "Sistem aktif değildir.");
  }

  Future<void> register(String email, String password, String passwordAgain) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_isEmailValid(email) && _isPasswordValid(password, passwordAgain)) {
      AlertManager.instance.showSnack(SnackType.success, message: "Bilgiler validate edildi");
    } else {
      AlertManager.instance.showSnack(SnackType.error, message: "Bilgiler validate edilemedi");
    }
  }

  bool _isEmailValid(String email) {
    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password, String passwordAgain) {
    RegExp passwordRegExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$");
    return password == passwordAgain && passwordRegExp.hasMatch(password);
  }
}
