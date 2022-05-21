import 'package:flutter/material.dart';
import 'package:zoomie/src/extensions/color.dart';
import 'package:zoomie/src/styling/helpers.dart';

/// Generic colors
const transparentColor = Colors.transparent;
const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF000000);
const lightGrey1Color = Color(0xFFF3F3F3);
const lightGrey2Color = Color(0xFFDDDDDD);
const lightGrey3Color = Color(0xFFCCCCCC);
const darkGrey1Color = Color(0xFF777777);
const darkGrey2Color = Color(0xFF323755);
const errorColor = Color(0xFFF8685E);
const controlsColor = Color(0xFF500B76);
const controlsDisabledColor = Color(0xFFBFBFBF);
const switchTrackSelectedColor = Color(0xFFB964B7);
const switchTrackDisabledColor = Color(0xFFDFDFDF);
const dividerColor = Color(0xFFE6E6E6);
const brandColor = Color(0xFFE94057);

/// Light theme colors
const lightSystemBarsColor = transparentColor;
const lightPrimaryColor = whiteColor;
const lightAccentColor = whiteColor;
const lightCanvasColor = whiteColor;
const lightControlsSelectedColor = controlsColor;
const lightControlsDisabledColor = controlsDisabledColor;
const lightSwitchTrackSelectedColor = switchTrackSelectedColor;
const lightSwitchTrackDisabledColor = switchTrackDisabledColor;
const lightDividerColor = dividerColor;

final lightAccentColorSwatch = lightAccentColor.toMaterialColor();
final lightControlsColorSwatch = createMaterial(
  selected: lightControlsSelectedColor,
  disabled: lightControlsDisabledColor,
);
final lightSwitchTrackColorSwatch = createMaterial(
  selected: lightSwitchTrackSelectedColor,
  disabled: lightSwitchTrackDisabledColor,
);

/// Dark theme colors
const darkSystemBarsColor = transparentColor;
const darkCanvasColor = blackColor;
