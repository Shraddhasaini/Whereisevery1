import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/home/filter/onboarddata.dart';

class ColorProvider with ChangeNotifier {
  Color _color = onboardData[0].accentColor;

  Color get color => _color;

  set color(Color color) {
    _color = color;
    notifyListeners();
  }
}