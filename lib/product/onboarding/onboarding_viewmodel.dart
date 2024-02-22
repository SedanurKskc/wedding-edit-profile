import 'package:flutter/material.dart';
import '../../core/base/state/base_state.dart';
import '../../core/modules/memory/prefs/prefs_manager.dart';
import '../../core/modules/navigate/manager.dart';
import 'onboarding_view.dart';

abstract class OnboardingViewmodel extends BaseState<OnboardingView> {
  final controller = OnboardingData();
  final pageController = PageController();
  int itemLength = 0;
  int currentIndex = 0;

  onButtonPressed() async {
    PreferencesManager.setBoolVal(PrefsKeys.isFirstOpen, false);
    await NavigationManager.instance.clear(path: NavPath.splash);
  }

  onPageChanged(int value) {
    setState(() => currentIndex = value);
  }

  onSkipPressed() {
    if (currentIndex == itemLength - 1) return;
    pageController.jumpToPage(itemLength - 1);
    setState(() => currentIndex = itemLength - 1);
  }

  @override
  void initState() {
    super.initState();
    itemLength = controller.items.length;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
