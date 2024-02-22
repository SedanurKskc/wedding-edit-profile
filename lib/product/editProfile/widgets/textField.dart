import 'package:flutter/material.dart';
import 'package:wedding/core/base/state/base_state.dart';

class TextFieldWidget extends BaseStateless {
  final TextEditingController controller;
  final String hintTextController;
  TextFieldWidget({required this.controller, required this.hintTextController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddings.h(sizes.s16),
      margin: paddings.v(sizes.s10) + paddings.h(sizes.s4),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sizes.s4),
        color: colorScheme(context).surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme(context).surface,
            blurRadius: 0.4,
            offset: Offset(0.40, 0.50),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintTextController, border: InputBorder.none),
      ),
    );
  }
}
