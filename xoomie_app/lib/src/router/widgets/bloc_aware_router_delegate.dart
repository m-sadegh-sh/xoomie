import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/auth/bloc/auth_bloc.dart';
import 'package:xoomie/src/auth/bloc/auth_state.dart';
import 'package:xoomie/src/home/views/home_page.dart';
import 'package:xoomie/src/introduction/views/introduction_page.dart';
import 'package:xoomie/src/router/bloc/router_bloc.dart';
import 'package:xoomie/src/router/bloc/router_event.dart';
import 'package:xoomie/src/router/bloc/router_state.dart';
import 'package:xoomie/src/sign_in/views/sign_in_method_page.dart';
import 'package:xoomie/src/sign_in/views/sign_in_with_email_page.dart';
import 'package:xoomie/src/sign_in/views/sign_in_with_google_page.dart';
import 'package:xoomie/src/sign_up/views/sign_up_method_page.dart';
import 'package:xoomie/src/sign_up/views/sign_up_with_email_page.dart';
import 'package:xoomie/src/splash/bloc/splash_bloc.dart';
import 'package:xoomie/src/splash/bloc/splash_state.dart';
import 'package:xoomie/src/splash/views/splash_page.dart';
import 'package:xoomie/src/unknown/views/unknown_page.dart';

class BlocAwareRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  BlocAwareRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    final routerBloc = BlocProvider.of<RouterBloc>(context);

    return BlocListener<AuthBloc, AuthStateBase>(
      listener: (_, state) {
        if (state is AuthAnonymousState) {
          routerBloc.add(const RouterResetEvent());
        }
      },
      child: BlocBuilder<SplashBloc, SplashStateBase>(
        builder: (_, splashState) => BlocBuilder<RouterBloc, RouterStateBase>(
          builder: (_, routerState) => BlocBuilder<AuthBloc, AuthStateBase>(
            builder: (_, authState) {
              return Navigator(
                key: _navigatorKey,
                pages: _createPages(splashState, routerState, authState),
                onPopPage: (route, result) {
                  if (!route.didPop(result)) return false;

                  if (routerState is RouterSignInWithStateBase) {
                    routerBloc.add(
                      const RouterGoToSignInMethodEvent(),
                    );
                  } else if (routerState is RouterSignUpWithStateBase) {
                    routerBloc.add(
                      const RouterGoToSignUpMethodEvent(),
                    );
                  } else if (routerState is RouterSignInMethodState ||
                      routerState is RouterSignUpMethodState) {
                    routerBloc.add(
                      const RouterResetEvent(),
                    );
                  }

                  return true;
                },
              );
            },
          ),
        ),
      ),
    );
  }

  List<Page> _createPages(
    SplashStateBase splashState,
    RouterStateBase routerState,
    AuthStateBase authState,
  ) {
    if (splashState is! SplashInitializedState) {
      return [const SplashPage()];
    }

    return [
      if (authState is AuthAnonymousState) ...[
        const IntroductionPage(),
        if (routerState is RouterSignUpMethodState) ...[
          const SignUpMethodPage(),
          if (routerState is RouterSignUpWithEmailState)
            const SignUpWithEmailPage()
        ] else if (routerState is RouterSignInMethodState) ...[
          const SignInMethodPage(),
          if (routerState is RouterSignInWithEmailState)
            const SignInWithEmailPage(),
          if (routerState is RouterSignInWithGoogleState)
            const SignInWithGooglePage()
        ],
      ] else if (authState is AuthAuthenticatedState) ...[
        const HomePage(),
      ] else
        const UnknownPage(),
    ];
  }

  @override
  Future<void> setNewRoutePath(dynamic configuration) => Future.value(null);
}
