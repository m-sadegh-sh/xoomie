import 'package:flutter/material.dart';
import 'package:xoomie/src/base/bloc/state_base.dart';
import 'package:xoomie/src/styling/color_palette.dart';

abstract class ThemeStateBase extends StateBase {
  const ThemeStateBase();

  static ThemeStateBase fromJson(
    Map<String, dynamic>? json,
  ) {
    final mode = json?['mode'] as String?;

    switch (mode) {
      case 'light':
        return const ThemeDetectedState(
          isDark: false,
        );

      case 'dark':
        return const ThemeDetectedState(
          isDark: true,
        );
    }

    return const ThemeUnknownState();
  }

  Map<String, dynamic>? toJson() => null;
}

class ThemeUnknownState extends ThemeStateBase {
  const ThemeUnknownState();
}

class ThemeDetectedState extends ThemeStateBase {
  final bool isDark;
  final bool derivedFromSystem;

  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  Brightness get brightness => isDark ? Brightness.light : Brightness.dark;

  Color get systemBarsColor =>
      isDark ? darkSystemBarsColor : lightSystemBarsColor;

  const ThemeDetectedState({
    required this.isDark,
    this.derivedFromSystem = false,
  });

  @override
  List<Object?> get props => [
        isDark,
        derivedFromSystem,
      ];

  @override
  Map<String, dynamic>? toJson() {
    if (!derivedFromSystem) {
      return null;
    }

    return {'mode': isDark ? 'dark' : 'light'};
  }
}
