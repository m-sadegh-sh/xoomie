import 'package:flutter/material.dart';
import 'package:xoomie/src/sign_in/views/sign_in_method_screen.dart';

class SignInMethodPage extends Page {
  const SignInMethodPage({
    super.key,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => const SignInMethodScreen(),
    );
  }
}
