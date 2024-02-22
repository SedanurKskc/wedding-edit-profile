import 'package:flutter/material.dart';
import '../../core/base/view/base_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewmodel {
  @override
  Widget build(BuildContext context) {
    return const BaseView();
  }
}
