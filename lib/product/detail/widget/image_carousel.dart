import 'package:flutter/material.dart';
import '../../../core/base/state/base_state.dart';

class ImageCarousel extends BaseStateless {
  final List<String> images;
  ImageCarousel({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(children: images.map((e) => Image.asset(e, fit: BoxFit.cover, height: deviceWidth(context) * 9 / 16)).toList()),
    );
  }
}
