import 'package:flutter/material.dart';
import '../../core/base/view/base_view.dart';
import '../../core/component/button/app_button.dart';
import '../../core/component/field/text.dart';
import '../../core/component/image/asset.dart';
import 'auth_viewmodel.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends AuthViewmodel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: CameloottAppBar(
        transparent: true,
        customRightIcon: IconButton(onPressed: onInfoPressed, icon: Icon(Icons.info_outline, color: colorScheme.background)),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: colorScheme.primary,
      body: Column(
        children: [
          SizedBox(height: emptyTop - sizes.s20),
          Padding(
            padding: paddings.v(sizes.s50),
            child: CustomAssetImage(height: 200, width: 200, imageName: assetName, imagePath: ImagePaths.images),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.background,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(sizes.s40), topRight: Radius.circular(sizes.s40)),
              ),
              padding: paddings.h(sizes.s40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: sizes.s40),
                  Padding(
                    padding: paddings.b(sizes.s20),
                    child: CustomField(controller: emailController, hintText: emailHintText),
                  ),
                  Padding(
                    padding: paddings.b(sizes.s20),
                    child: CustomField(controller: passController, hintText: passwordHintText, obscureText: true),
                  ),
                  Visibility(
                    visible: !isLoginMode,
                    child: Padding(
                      padding: paddings.b(sizes.s20),
                      child: CustomField(controller: passAgainController, hintText: passwordAgainHintText, obscureText: true),
                    ),
                  ),
                  AppButton.zero(variant: ButtonVariant.primary, title: buttonTitle.toUpperCase(), onPressed: save),
                  SizedBox(height: sizes.s20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        questionTitle,
                        style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: changeType,
                        child: Text(
                          changeButtonTitle,
                          style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
