import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  MaterialColor toMaterialColor() {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        _getPart(ds, red),
        _getPart(ds, green),
        _getPart(ds, blue),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }

  int _getPart(double ds, int color) {
    return color + ((ds < 0 ? color : (255 - color)) * ds).round();
  }
}
