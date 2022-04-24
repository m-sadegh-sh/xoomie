import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vomie/src/router/bloc/router_bloc.dart';
import 'package:vomie/src/splash/bloc/splash_event.dart';
import 'package:vomie/src/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEventBase, SplashStateBase> {
  final RouterBloc routerBloc;
  // final AuthBloc authBloc;

  late StreamSubscription authSubscription;

  SplashBloc({
    required this.routerBloc,
    // required this.authBloc,
  }) : super(const SplashInitialState()) {
    on<SplashInitializeEvent>(_onInitialize);
    on<SplashInitializingEvent>(_onInitializing);
    on<SplashInitializedEvent>(_onInitialized);
    on<SplashInitializationFailedEvent>(_onInitializationFailed);

    // authSubscription = authBloc.stream.listen(_handleAuthUpdates);

    add(SplashInitializeEvent());
  }

  @override
  Future<void> close() async {
    // await authSubscription.cancel();
    await super.close();
  }

  void _onInitialize(
    SplashInitializeEvent event,
    Emitter<SplashStateBase> emit,
  ) {}

  void _onInitializing(
    SplashInitializingEvent event,
    Emitter<SplashStateBase> emit,
  ) =>
      emit(SplashInitializingState(event.message));

  void _onInitialized(
    SplashInitializedEvent event,
    Emitter<SplashStateBase> emit,
  ) =>
      emit(SplashInitializedState());

  void _onInitializationFailed(
    SplashInitializationFailedEvent event,
    Emitter<SplashStateBase> emit,
  ) =>
      emit(SplashInitializationFailedState(event.message));

  // void _handleAuthUpdates(AuthStateBase state) {
  //   if (state is AuthInitialState) {
  //     authBloc.add(const AuthTryToAuthenticateEvent());
  //     return;
  //   }

  //   if (state is AuthAuthenticatingState) {
  //     add(
  //       SplashInitializingEvent(
  //         (x) => x.splashScreenAuthAuthenticating,
  //       ),
  //     );
  //     return;
  //   }

  //   if (state is AuthAuthenticatedState) {
  //     add(const SplashInitializedEvent());
  //     routerBloc.add(
  //       const RouterGoToHomeEvent(
  //         selectedContent: HomeContents.challenges,
  //       ),
  //     );
  //     return;
  //   }

  //   if (state is AuthAnonymousState) {
  //     add(const SplashInitializedEvent());
  //     routerBloc.add(const RouterGoToStartEvent());
  //     return;
  //   }

  //   if (state is AuthAuthenticateFailedState) {
  //     add(SplashInitializationFailedEvent(state.message));
  //     return;
  //   }
  // }
}
