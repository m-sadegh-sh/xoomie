import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vomie/src/router/bloc/router_event.dart';
import 'package:vomie/src/router/bloc/router_state.dart';

class RouterBloc extends Bloc<RouterEventBase, RouterStateBase> {
  RouterBloc() : super(const RouterSplashState()) {
    on<RouterGoToSplashEvent>(_onGoToSplash);
    on<RouterGoToIntroductionEvent>(_onGoToIntroduction);
    on<RouterGoToGettingStartedEvent>(_onGoToGettingStarted);
    on<RouterGoToAuthEvent>(_onGoToAuth);
    on<RouterGoToHomeEvent>(_onGoToMain);
  }

  void _onGoToSplash(
    RouterGoToSplashEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterSplashState());

  void _onGoToIntroduction(
    RouterGoToIntroductionEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterIntroductionState());

  void _onGoToGettingStarted(
    RouterGoToGettingStartedEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterGettingStartedState());

  void _onGoToAuth(
    RouterGoToAuthEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(
        RouterAuthState(
          authMode: event.authMode,
        ),
      );

  void _onGoToMain(
    RouterGoToHomeEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(
        RouterHomeState(
          selectedContent: event.selectedContent,
        ),
      );
}
