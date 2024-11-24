import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
const List<Color> _colorThemes = [
  _customColor,
  Colors.green,
  Colors.pink,
  Colors.red,
  Colors.yellow,
  Colors.deepOrange,
  Colors.blueAccent,
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must between 0 and${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
