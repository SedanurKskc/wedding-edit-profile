import 'package:flutter/material.dart';
import '../../../core/base/state/base_state.dart';
import '../../../modules/service/service_model.dart';
export '../../../modules/service/service_model.dart';

class ServiceBox extends BaseStateless {
  final ServiceModel model;

  ServiceBox(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddings.a(sizes.s10),
      margin: paddings.h(sizes.s40) + paddings.b(sizes.s10),
      decoration: BoxDecoration(color: ColorUtility.surface, borderRadius: BorderRadius.circular(sizes.s4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(model.header ?? "", style: textTheme(context).labelSmall!.copyWith(color: colorScheme(context).onSurface)),
          Text(model.value ?? "", style: textTheme(context).titleMedium!.copyWith(color: colorScheme(context).onSurface)),
        ],
      ),
    );
  }
}
