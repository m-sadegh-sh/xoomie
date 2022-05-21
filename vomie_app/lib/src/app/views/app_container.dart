import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomie/src/app/views/app_screen.dart';
import 'package:zoomie/src/auth/bloc/auth_bloc.dart';
import 'package:zoomie/src/injection/container.dart';
import 'package:zoomie/src/router/bloc/router_bloc.dart';
import 'package:zoomie/src/splash/bloc/splash_bloc.dart';
import 'package:zoomie/src/theme/bloc/theme_bloc.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => resolve<ThemeBloc>(),
        ),
        BlocProvider(
          create: (_) => resolve<RouterBloc>(),
        ),
        BlocProvider(
          create: (_) => resolve<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => resolve<SplashBloc>(),
        )
      ],
      child: const AppScreen(),
    );
  }
}
