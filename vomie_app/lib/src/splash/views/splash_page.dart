import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vomie/src/injection/container.dart';
import 'package:vomie/src/splash/bloc/splash_bloc.dart';
import 'package:vomie/src/splash/views/splash_screen.dart';

class SplashPage extends Page {
  const SplashPage() : super(key: const ValueKey('SplashPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => BlocProvider.value(
        value: resolve<SplashBloc>(),
        child: const SplashScreen(),
      ),
      fullscreenDialog: true,
    );
  }
}
