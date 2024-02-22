import 'package:flutter/material.dart';
import 'package:wedding/product/auth/auth_view.dart';

import '../editProfile/editProfile_view.dart';
import '../home/home_view.dart';
import '../onboarding/onboarding_view.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewmodel {
  @override
  Widget build(BuildContext context) {
    if (isFirstOpen) return const EditProfileView();
    if (userLoggedIn) return const HomeView();
    return const AuthView();
  }
}
