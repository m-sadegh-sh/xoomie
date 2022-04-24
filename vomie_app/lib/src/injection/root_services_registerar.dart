import 'package:vomie/src/injection/container.dart';
import 'package:vomie/src/router/bloc/router_bloc.dart';
import 'package:vomie/src/splash/bloc/splash_bloc.dart';

void registerRootServices() {
  // registerSingleton<UrlFactoryBase>(
  //   (_) => EnvironmentBasedUrlFactory(
  //     values: dotenv.env,
  //   ),
  // );

  registerSingleton(
    (_) => RouterBloc(),
  );

  // registerSingleton(
  //   (c) => AuthBloc(routerBloc: c(), wordsBloc: c()),
  // );

  registerSingleton(
    (c) => SplashBloc(
      routerBloc: c(),
      // authBloc: c(),
    ),
  );
}
