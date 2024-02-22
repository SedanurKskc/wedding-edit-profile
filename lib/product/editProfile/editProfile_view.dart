import 'package:flutter/material.dart';
import 'package:wedding/core/base/view/base_view.dart';
import 'package:wedding/product/editProfile/editProfile_viewmodel.dart';
import 'package:wedding/product/editProfile/widgets/textField.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends EditProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      backgroundColor: colorScheme.background,
      appBar: CameloottAppBar(
        transparent: false,
        title: "Profili Güncelle",
        customLeftIcon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
      body: Padding(
        padding: paddings.h(sizes.s20) + paddings.t(sizes.s32),
        child: Expanded(
          child: Column(
            children: [
              TextFieldWidget(controller: adSoyadController, hintTextController: adSoyadHinttext),
              TextFieldWidget(controller: emailController, hintTextController: emailHintText),
              TextFieldWidget(controller: cinsiyetController, hintTextController: cinsiyetHintText),
              TextFieldWidget(controller: dogumTarihiController, hintTextController: dogumTarihiHintText),
              Spacer(),
              InkWell(
                onTap: onPressedButton,
                child: Container(
                  height: 40,
                  width: deviceWidth * 3 / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(sizes.s32),
                      gradient: LinearGradient(colors: [colorScheme.secondary, colorScheme.primary], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                  child: Center(
                    child: isUpdating ? CircularProgressIndicator() : Text(ButtonTitle, style: textTheme.labelLarge),
                  ),
                ),
              ),
              SizedBox(height: emptyBottom),
            ],
          ),
        ),
      ),
    );
  }
}
