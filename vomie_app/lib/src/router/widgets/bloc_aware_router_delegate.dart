import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vomie/src/router/bloc/router_bloc.dart';
import 'package:vomie/src/router/bloc/router_event.dart';
import 'package:vomie/src/router/bloc/router_state.dart';
import 'package:vomie/src/splash/views/splash_page.dart';
import 'package:vomie/src/unknown/views/unknown_page.dart';

class BlocAwareRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  BlocAwareRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    final routerBloc = BlocProvider.of<RouterBloc>(context);

    return BlocBuilder<RouterBloc, RouterStateBase>(
      builder: (_, state) {
        return Navigator(
          key: _navigatorKey,
          pages: _stateToPages(state),
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            // TODO: Handle pop event by updating RouterBloc.

            if (state is RouterGettingStartedState) {
              routerBloc.add(
                const RouterGoToIntroductionEvent(),
              );
            } else if (state is RouterAuthState) {
              routerBloc.add(
                const RouterGoToIntroductionEvent(),
              );
            }

            return true;
          },
        );
      },
    );
  }

  List<Page> _stateToPages(RouterStateBase state) {
    return [
      if (state is RouterSplashState)
        const SplashPage()
      // else if (state is RouterStartState)
      //   const StartPage()
      // else if (state is RouterGettingStartedState) ...[
      //   const StartPage(),
      //   const GettingStartedPage(),
      // ] else if (state is RouterAuthState) ...[
      //   const StartPage(),
      //   AuthFormPage(authMode: state.authMode),
      // ] else if (state is RouterHomeState)
      //   const HomePage()
      else
        const UnknownPage(),
    ];
  }

  @override
  Future<void> setNewRoutePath(dynamic configuration) => Future.value(null);
}
