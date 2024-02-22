import 'package:flutter/material.dart';
import 'package:wedding/core/base/view/base_view.dart';
import '../../core/base/util/color.dart';
import '../../core/component/box/background_box.dart';
import '../../core/component/dot/onboard_dot.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends BaseView {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends OnboardingViewmodel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundBox(),
          Padding(
            padding: paddings.h(sizes.s20),
            child: Column(
              children: [
                SizedBox(height: emptyTop - sizes.s20),
                Visibility(
                  visible: currentIndex != 2,
                  replacement: TextButton(onPressed: () {}, child: const SizedBox()),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: onSkipPressed,
                      child: Text("Atla", style: textTheme.headlineSmall),
                    ),
                  ),
                ),
                body(),
                OnboardDot(length: itemLength, currentIndex: currentIndex),
                Visibility(
                  visible: currentIndex == 2,
                  replacement: SizedBox(height: sizes.s50 + sizes.s20),
                  child: button(),
                ),
                SizedBox(height: emptyBottom),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: itemLength,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Spacer(flex: 1),
              Text(controller.items[currentIndex].header, style: textTheme.headlineLarge, textAlign: TextAlign.center),
              const Spacer(flex: 2),
              SizedBox(height: (deviceWidth - sizes.s40) * 9 / 16, child: Image.asset(controller.items[currentIndex].image, fit: BoxFit.contain)),
              const Spacer(flex: 3),
              Text(
                controller.items[currentIndex].description,
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
            ],
          );
        },
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: paddings.h(sizes.s20) + paddings.t(sizes.s20),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onButtonPressed,
        child: Container(
          height: sizes.s50,
          decoration: ShapeDecoration(color: ColorUtility.background, shape: const StadiumBorder()),
          child: Center(child: Text("BAŞLAYALIM", style: textTheme.titleLarge!.copyWith(color: colorScheme.primary))),
        ),
      ),
    );
  }
}

class OnboardingInfo {
  final String header;
  final String description;
  final String image;

  OnboardingInfo({
    required this.header,
    required this.description,
    required this.image,
  });
}

class OnboardingData {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      header: "Hayalinizdeki\nDüğün",
      description: "Wedding Hall olarak hayalinizi gerçekleştirmenize yardımcı oluyoruz",
      image: "assets/images/entry1.png",
    ),
    OnboardingInfo(
      header: "Nokta Atışı\nServis",
      description: "Seçili bölgelerde verilen kaliteli hizmetlerle en doğru seçimi yapmanızı sağlıyoruz",
      image: "assets/images/entry2.png",
    ),
    OnboardingInfo(
      header: "Yeni Hayata\nMutlu Başlangıç",
      description: "Wedding Hall olarak hayalinizi gerçekleştirmenize yardımcı oluyoruz",
      image: "assets/images/entry3.png",
    ),
  ];
}
