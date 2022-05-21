import 'package:zoomie/src/auth/bloc/auth_bloc.dart';
import 'package:zoomie/src/auth/bloc/auth_repository.dart';
import 'package:zoomie/src/injection/container.dart';
import 'package:zoomie/src/router/bloc/router_bloc.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_with_email_bloc.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_repository.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_with_google_bloc.dart';
import 'package:zoomie/src/sign_out/bloc/sign_out_bloc.dart';
import 'package:zoomie/src/sign_out/bloc/sign_out_repository.dart';
import 'package:zoomie/src/sign_up/bloc/sign_up_repository.dart';
import 'package:zoomie/src/sign_up/bloc/sign_up_with_email_bloc.dart';
import 'package:zoomie/src/splash/bloc/splash_bloc.dart';
import 'package:zoomie/src/theme/bloc/theme_bloc.dart';

void registerRootServices() {
  registerSingleton(
    (_) => ThemeBloc(),
  );

  registerSingleton(
    (_) => RouterBloc(),
  );

  registerFactory<AuthRepositoryBase>(
    (c) => FirebaseAuthRepository(),
  );

  registerFactory(
    (c) => AuthBloc(
      repository: c(),
    ),
  );

  registerFactory(
    (c) => SplashBloc(),
  );

  registerFactory<SignUpRepositoryBase>(
    (c) => FirebaseSignUpRepository(),
  );

  registerFactory(
    (c) => SignUpWithEmailBloc(
      repository: c(),
    ),
  );

  registerFactory<SignInRepositoryBase>(
    (c) => FirebaseSignInRepository(),
  );

  registerFactory(
    (c) => SignInWithEmailBloc(
      repository: c(),
    ),
  );

  registerFactory(
    (c) => SignInWithGoogleBloc(
      repository: c(),
    ),
  );

  registerFactory<SignOutRepositoryBase>(
    (c) => FirebaseSignOutRepository(),
  );

  registerFactory(
    (c) => SignOutBloc(
      repository: c(),
    ),
  );
}
