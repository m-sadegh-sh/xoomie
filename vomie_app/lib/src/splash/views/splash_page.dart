import 'package:flutter/material.dart';
import 'package:zoomie/src/splash/views/splash_screen.dart';

class SplashPage extends Page {
  const SplashPage({
    super.key,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => const SplashScreen(),
      fullscreenDialog: true,
    );
  }
}
