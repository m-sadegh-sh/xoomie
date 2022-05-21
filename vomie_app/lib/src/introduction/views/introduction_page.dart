import 'package:flutter/material.dart';
import 'package:zoomie/src/introduction/views/introduction_screen.dart';

class IntroductionPage extends Page {
  const IntroductionPage({
    super.key,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => const IntroductionScreen(),
    );
  }
}
