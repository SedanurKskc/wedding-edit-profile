import 'package:flutter/material.dart';

class OnboardDot extends StatelessWidget {
  final int length;
  final int currentIndex;
  const OnboardDot({super.key, required this.length, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: currentIndex == index ? Colors.white : Colors.grey,
          ),
          height: 7,
          width: currentIndex == index ? 15 : 7,
          duration: const Duration(milliseconds: 700),
        ),
      ),
    );
  }
}
