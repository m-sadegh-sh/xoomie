import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/app/views/app_screen.dart';
import 'package:xoomie/src/auth/bloc/auth_bloc.dart';
import 'package:xoomie/src/injection/container.dart';
import 'package:xoomie/src/router/bloc/router_bloc.dart';
import 'package:xoomie/src/splash/bloc/splash_bloc.dart';
import 'package:xoomie/src/theme/bloc/theme_bloc.dart';

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
