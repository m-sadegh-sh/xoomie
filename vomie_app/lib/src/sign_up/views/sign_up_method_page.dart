import 'package:flutter/material.dart';
import 'package:zoomie/src/sign_up/views/sign_up_method_screen.dart';

class SignUpMethodPage extends Page {
  const SignUpMethodPage({
    super.key,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => const SignUpMethodScreen(),
    );
  }
}
