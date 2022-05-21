import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/injection/container.dart';
import 'package:xoomie/src/sign_up/bloc/sign_up_with_email_bloc.dart';
import 'package:xoomie/src/sign_up/views/sign_up_with_email_screen.dart';

class SignUpWithEmailPage extends Page {
  const SignUpWithEmailPage({
    super.key,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => BlocProvider(
        create: (_) => resolve<SignUpWithEmailBloc>(),
        child: const SignUpWithEmailScreen(),
      ),
    );
  }
}
