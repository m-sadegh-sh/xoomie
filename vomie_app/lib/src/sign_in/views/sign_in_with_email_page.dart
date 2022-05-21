import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/injection/container.dart';
import 'package:xoomie/src/sign_in/bloc/sign_in_with_email_bloc.dart';
import 'package:xoomie/src/sign_in/views/sign_in_with_email_screen.dart';

class SignInWithEmailPage extends Page {
  const SignInWithEmailPage({
    super.key,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => BlocProvider(
        create: (_) => resolve<SignInWithEmailBloc>(),
        child: const SignInWithEmailScreen(),
      ),
    );
  }
}
