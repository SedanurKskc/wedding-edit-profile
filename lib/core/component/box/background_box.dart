import 'package:flutter/material.dart';
import 'package:wedding/core/base/state/base_state.dart';

class BackgroundBox extends BaseStateless {
  BackgroundBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context),
      width: deviceWidth(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [ColorUtility.secondary, ColorUtility.primary],
          stops: const [0.1, 1.0],
        ),
      ),
    );
  }
}
