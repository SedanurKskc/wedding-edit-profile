import 'package:flutter/material.dart';

class ColorUtility {
  ///Primary Color
  static Color primary = '84173E'.toColor;

  ///On Primary Color
  static Color onPrimary = 'A54396'.toColor;

  ///Tertiary Color
  static Color get tertiary => '5248C6'.toColor;

  ///On Tertiary Color
  static Color get onTertiary => '885EBD'.toColor;

  ///Secondary Color
  static Color get secondary => 'D3200C'.toColor;

  ///On Secondary Color
  static Color get onSecondary => '778CA3'.toColor;

  ///Background Color
  static Color get background => 'EBEBF7'.toColor;

  ///On Background Color
  static Color get onBackground => '303952'.toColor;

  ///Success Color
  static Color get success => '55B685'.toColor;

  ///Warning Color
  static Color get warning => 'FD9D42'.toColor;

  ///Error Color
  static Color get error => 'E74B3C'.toColor;

  ///Surface Color
  static Color get surface => 'FFFFFF'.toColor;

  ///On Surface Color
  static Color get onSurface => '000000'.toColor;
}

extension StringToColor on String {
  Color get toColor => Color(int.parse('FF${toUpperCase().replaceAll('#', '')}', radix: 16));
}
