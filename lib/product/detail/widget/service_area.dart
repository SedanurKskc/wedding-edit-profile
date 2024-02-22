import 'package:flutter/material.dart';
import '../../../core/base/state/base_state.dart';
import 'service_box.dart';

class ServiceArea extends BaseStateless {
  final String header;
  final bool headerVisible;
  final List<ServiceModel> services;
  ServiceArea({required this.header, this.headerVisible = true, required this.services, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(context, header, headerVisible),
        Column(children: services.map((e) => ServiceBox(e)).toList()),
      ],
    );
  }

  Widget _header(BuildContext context, String title, bool visible) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: paddings.a(sizes.s10),
        child: Text(title, style: textTheme(context).labelLarge!.copyWith(color: colorScheme(context).secondary)),
      ),
    );
  }
}

