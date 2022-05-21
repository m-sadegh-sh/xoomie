import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/app/widgets/theme_observer.dart';
import 'package:xoomie/src/base/widgets/auto_unfocus.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/router/widgets/bloc_aware_router_delegate.dart';
import 'package:xoomie/src/styling/themes.dart';
import 'package:xoomie/src/theme/bloc/theme_bloc.dart';
import 'package:xoomie/src/theme/bloc/theme_state.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeObserver(
      child: BlocBuilder<ThemeBloc, ThemeStateBase>(
        builder: (context, state) => AutoUnfocus(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
            onGenerateTitle: (_) => LocalizedText.get(_, (x) => x.appTitle),
            themeMode: state is ThemeDetectedState ? state.themeMode : null,
            theme: lightTheme,
            darkTheme: darkTheme,
            localizationsDelegates: LocalizedText.localizationsDelegates,
            supportedLocales: LocalizedText.supportedLocales,
            home: Router(
              routerDelegate: BlocAwareRouterDelegate(),
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          ),
        ),
      ),
    );
  }
}
