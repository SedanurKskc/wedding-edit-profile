import 'package:flutter/material.dart';
import '../../core/base/view/base_view.dart';
import 'plan_viewmodel.dart';
import 'widget/parent_item.dart';

class PlanView extends StatefulWidget {
  const PlanView({super.key});
  @override
  State<PlanView> createState() => _PlanViewState();
}
class _PlanViewState extends PlanViewmodel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      isLoading: isLoading,
      appBar: const CameloottAppBar(transparent: false, title: "Evlilik Planı"),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.primary,
        unselectedItemColor: colorScheme.background,
        currentIndex: currentIndex,
        fixedColor: colorScheme.background,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: colorScheme.background), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.book, color: colorScheme.background), label: "Evlilik Planı"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box, color: colorScheme.background), label: "Profil"),
        ],
      ),
      body: Padding(
        padding: paddings.h(sizes.s20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: groupedList.map<Widget>((e) => ParentItem(e.$1, e.$2, onItemChanged)).toList()),
        ),
      ),
    );
  }
}
