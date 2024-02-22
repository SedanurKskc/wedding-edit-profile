import 'package:flutter/material.dart';
import 'package:wedding/core/base/state/base_state.dart';

class HallNameArea extends BaseStateless {
  final String name;
  HallNameArea(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: paddings.h(sizes.s40) + paddings.t((deviceWidth(context) * 9 / 16) - (deviceHeight(context) * 1 / 40)),
      height: deviceHeight(context) * 1 / 20,
      decoration: BoxDecoration(color: colorScheme(context).primary, borderRadius: BorderRadius.circular(sizes.s10)),
      child: Center(child: Text(name, style: textTheme(context).headlineSmall)),
    );
  }
}
