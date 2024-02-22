import 'package:flutter/material.dart';
import 'package:wedding/core/base/state/base_state.dart';

class TextFieldWidget extends BaseStateless {
  final TextEditingController controller;
  final String hintTextController;
  TextFieldWidget({required this.controller, required this.hintTextController});

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: paddings.h(sizes.s20),
     margin: paddings.v(sizes.s10),
          height: sizes.s40,
          width: deviceWidth(context) - sizes.s40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorUtility.surface,
            boxShadow: [BoxShadow(color: ColorUtility.onSurface.withOpacity(0.1), blurRadius: 5, spreadRadius: 1, offset: const Offset(0, 2))],
          ),
      
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintTextController, border: InputBorder.none),
      ),
    );
  }
}
