import 'package:flutter/material.dart';
import 'package:wedding/modules/auth/manager.dart';
import '../../core/base/state/base_state.dart';
import '../../core/modules/navigate/manager.dart';
import 'text.dart';
import 'auth_view.dart';

abstract class AuthViewmodel extends BaseState<AuthView> with AuthViewText {
  static final AuthManager _manager = AuthManager();

  bool isLoginMode = true;

  String get questionTitle => isLoginMode ? "Hesabınız yok mu?" : "Hesabınız var mı?";
  String get changeButtonTitle => isLoginMode ? "Kayıt Ol" : "Giriş Yap";
  String get buttonTitle => !isLoginMode ? "Kayıt Ol" : "Giriş Yap";

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passAgainController = TextEditingController();

  changeType() {
    emailController.text = "";
    passController.text = "";
    passAgainController.text = "";
    setState(() => isLoginMode = !isLoginMode);
  }

  onInfoPressed() async {
    await NavigationManager.instance.nav(path: NavPath.onboarding);
  }

  save() async {
    if (isLoginMode) {
      await _manager.login(emailController.text, passController.text);
    } else {
      await _manager.register(emailController.text, passController.text, passAgainController.text);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
