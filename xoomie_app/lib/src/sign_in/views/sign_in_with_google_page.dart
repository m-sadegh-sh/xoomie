import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/injection/container.dart';
import 'package:xoomie/src/sign_in/bloc/sign_in_with_google_bloc.dart';
import 'package:xoomie/src/sign_in/views/sign_in_with_google_screen.dart';

class SignInWithGooglePage extends Page {
  const SignInWithGooglePage({
    super.key,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => BlocProvider(
        create: (_) => resolve<SignInWithGoogleBloc>(),
        child: const SignInWithGoogleScreen(),
      ),
    );
  }
}
