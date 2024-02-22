import 'package:flutter/material.dart';
import 'package:wedding/product/editProfile/editProfile_view.dart';
import 'package:wedding/product/editProfile/text.dart';
import '../../core/base/state/base_state.dart';
import '../../modules/editProfile/update_manager.dart';

abstract class EditProfileViewModel extends BaseState<EditProfileView> with EditProfileText {
  static final UpdateManager _manager = UpdateManager();
  bool isUpdating = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController adSoyadController = TextEditingController();
  TextEditingController cinsiyetController = TextEditingController();
  TextEditingController dogumTarihiController = TextEditingController();
  String get buttonTitle => ButtonTitle;

  update() async {
    await _manager.update(adSoyadController.text, emailController.text, cinsiyetController.text, dogumTarihiController.text);
  }

  onPressedButton() async {
    setState(() {
      isUpdating = true;
    });
    await update();
    setState(() {
      isUpdating = false;
    });
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
