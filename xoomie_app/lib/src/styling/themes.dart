import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:xoomie/src/styling/color_palette.dart';
import 'package:xoomie/src/styling/helpers.dart';
import 'package:xoomie/src/styling/variables.dart';

const baseTextStyle = TextStyle(
  fontFamily: fontFamily,
);

final baseButtonStyle = ButtonStyle(
  elevation: createMaterial(
    fallback: 0,
  ),
  alignment: Alignment.center,
  shape: createMaterial(
    fallback: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        borderRadiusMedium,
      ),
    ),
  ),
);

final baseLargeButtonStyle = baseButtonStyle.copyWith(
  visualDensity: const VisualDensity(
    horizontal: VisualDensity.maximumDensity,
    vertical: VisualDensity.maximumDensity,
  ),
  textStyle: createMaterial(
    fallback: baseTextStyle.copyWith(
      fontWeight: FontWeight.w600,
    ),
  ),
);

const defaultPageTransitionsBuilder = SharedAxisPageTransitionsBuilder(
  transitionType: SharedAxisTransitionType.scaled,
);

final baseTheme = ThemeData(
  fontFamily: fontFamily,
  dividerTheme: const DividerThemeData(
    thickness: 1.0,
  ),
  scaffoldBackgroundColor: transparentColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: transparentColor,
  ),
  cardTheme: CardTheme(
    elevation: 2.0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        borderRadiusMedium,
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 4.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedIconTheme: IconThemeData(
      size: iconSizeLarge,
    ),
    selectedIconTheme: IconThemeData(
      size: iconSizeLarge,
    ),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0.0,
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        borderRadiusMedium,
      ),
    ),
  ),
  tabBarTheme: const TabBarTheme(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: baseLargeButtonStyle.copyWith(
      side: createMaterial(
        fallback: BorderSide.none,
      ),
      backgroundColor: createMaterial(
        fallback: brandColor,
        disabled: brandColor.withOpacity(0.75),
      ),
      foregroundColor: createMaterial(
        fallback: whiteColor,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: baseLargeButtonStyle.copyWith(
      padding: createMaterial(
        fallback: EdgeInsets.zero,
      ),
      side: createMaterial(
        fallback: const BorderSide(
          color: lightGrey1Color,
        ),
      ),
      foregroundColor: createMaterial(
        fallback: brandColor,
      ),
      overlayColor: createMaterial(
        fallback: brandColor.withOpacity(0.05),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: baseButtonStyle.copyWith(
      backgroundColor: createMaterial(
        fallback: transparentColor,
      ),
      foregroundColor: createMaterial(
        fallback: brandColor,
      ),
      overlayColor: createMaterial(
        fallback: brandColor.withOpacity(0.05),
      ),
      textStyle: createMaterial(
        fallback: baseTextStyle.copyWith(
          fontSize: fontSizeSmall,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: brandColor.withOpacity(0.35),
    selectionHandleColor: brandColor,
    cursorColor: brandColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    errorBorder: createInputBorder(
      borderColor: errorColor,
    ),
    focusedErrorBorder: createInputBorder(
      borderColor: errorColor,
    ),
    labelStyle: baseTextStyle.copyWith(
      fontSize: fontSizeSmall,
    ),
    floatingLabelStyle: baseTextStyle.copyWith(
      fontSize: fontSizeXSmall,
      fontWeight: FontWeight.w300,
    ),
  ),
  checkboxTheme: const CheckboxThemeData(),
  radioTheme: const RadioThemeData(),
  switchTheme: const SwitchThemeData(),
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: baseTextStyle.copyWith(
      fontSize: fontSizeMedium,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: baseTextStyle.copyWith(
      fontSize: fontSizeXLarge,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: baseTextStyle.copyWith(
      fontSize: fontSizeMedium,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: baseTextStyle.copyWith(
      fontSize: fontSizeLarge,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: baseTextStyle.copyWith(
      fontSize: fontSizeLarge,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: baseTextStyle.copyWith(
      fontSize: fontSizeSmall,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: baseTextStyle.copyWith(
      fontSize: fontSizeSmall,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: baseTextStyle.copyWith(
      fontSize: fontSizeXSmall,
      fontWeight: FontWeight.w300,
    ),
  ),
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: lightGrey3Color,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadiusMedium),
      ),
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: defaultPageTransitionsBuilder,
      TargetPlatform.iOS: defaultPageTransitionsBuilder,
      TargetPlatform.linux: defaultPageTransitionsBuilder,
      TargetPlatform.macOS: defaultPageTransitionsBuilder,
      TargetPlatform.windows: defaultPageTransitionsBuilder,
    },
  ),
);

final lightTheme = baseTheme.copyWith(
  brightness: Brightness.light,
  primaryColor: lightPrimaryColor,
  canvasColor: lightCanvasColor,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: lightAccentColorSwatch,
  ).copyWith(secondary: lightAccentColor),
  bottomNavigationBarTheme: baseTheme.bottomNavigationBarTheme.copyWith(
    elevation: 0.0,
    backgroundColor: lightGrey1Color,
    unselectedItemColor: lightBottomNavigationUnselectedItemColor,
    selectedItemColor: lightBottomNavigationSelectedItemColor,
  ),
  inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
    border: createInputBorder(
      borderColor: lightGrey1Color,
    ),
    disabledBorder: createInputBorder(
      borderColor: lightGrey1Color,
    ),
    enabledBorder: createInputBorder(
      borderColor: lightGrey2Color,
    ),
    focusedBorder: createInputBorder(
      borderColor: lightGrey3Color,
    ),
    labelStyle: baseTheme.inputDecorationTheme.labelStyle!.copyWith(
      color: darkGrey1Color,
    ),
    floatingLabelStyle:
        baseTheme.inputDecorationTheme.floatingLabelStyle!.copyWith(
      color: lightGrey3Color,
    ),
  ),
  textTheme: baseTheme.textTheme.copyWith(
    titleLarge: baseTheme.textTheme.titleLarge!.copyWith(
      color: blackColor,
    ),
    titleMedium: baseTheme.textTheme.titleMedium!.copyWith(
      color: blackColor,
    ),
    titleSmall: baseTheme.textTheme.titleSmall!.copyWith(
      color: blackColor,
    ),
    bodyLarge: baseTheme.textTheme.bodyLarge!.copyWith(
      color: brandColor,
    ),
    bodyMedium: baseTheme.textTheme.bodyMedium!.copyWith(
      color: darkGrey2Color,
    ),
    bodySmall: baseTheme.textTheme.bodySmall!.copyWith(
      color: darkGrey2Color,
    ),
    labelSmall: baseTheme.textTheme.labelSmall!.copyWith(
      color: darkGrey1Color,
    ),
  ),
);

final darkTheme = baseTheme.copyWith(
  brightness: Brightness.dark,
  canvasColor: darkCanvasColor,
);
