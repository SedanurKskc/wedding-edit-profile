import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../product/home/home_view.dart';
import '../../../product/onboarding/onboarding_view.dart';
import '../../../product/splash/splash_view.dart';
import '../../base/view/not_found.dart';
import 'path.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavPath.splash:
        return normalNavigate(const SplashView());
      case NavPath.home:
        return normalNavigate(const HomeView());
      case NavPath.onboarding:
        return normalNavigate(const OnboardingView());
      default:
        return normalNavigate(NotFoundView());
    }
  }

  PageRoute normalNavigate(Widget widget) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget) : CupertinoPageRoute(builder: (context) => widget);
  }

  PageRoute normalNavigateToPop(Widget widget) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget) : CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true);
  }
}
