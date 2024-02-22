import 'package:flutter/material.dart';

import '../../base/state/base_state.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends BaseState<CustomBottomBar> {
  final List<(String, IconData)> icons = [
    ('Menü', Icons.menu_book_outlined),
    ('Sanal Tur', Icons.rotate_left_outlined),
    ('Rezervasyon', Icons.calendar_month_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + bottomPadding,
      decoration: BoxDecoration(color: ColorUtility.primary),
      child: Row(children: icons.map<Widget>((e) => _barItem(e)).toList()),
    );
  }

  Expanded _barItem((String, IconData) e) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(e.$2, color: ColorUtility.surface, size: sizes.s20),
            Text(e.$1, style: TextStyle(color: ColorUtility.surface)),
          ],
        ),
      ),
    );
  }
}
