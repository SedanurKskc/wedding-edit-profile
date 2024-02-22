import 'package:flutter/material.dart';
import '../../core/base/view/base_view.dart';
import '../../core/component/bottombar/bottombar.dart';
import '../../core/component/icon/icon.dart';
import 'widget/hall_name_area.dart';
import 'widget/image_carousel.dart';
import 'widget/service_area.dart';
import 'detail_viewmodel.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends DetailViewmodel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      isLoading: isLoading,
      appBar: CameloottAppBar(
        transparent: true,
        leadingBackgroundActive: true,
        backIconVisible: true,
        customRightIcon: IconWidget(icon: favorited ? Icons.favorite : Icons.favorite_border, onPressed: onFavoriteClicked),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(fit: StackFit.loose, children: [ImageCarousel(images: images), HallNameArea(name)]),
            SizedBox(height: sizes.s20),
            ServiceArea(header: "", headerVisible: false, services: mainServices),
            ServiceArea(header: "Hizmetler", services: sideServices),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
