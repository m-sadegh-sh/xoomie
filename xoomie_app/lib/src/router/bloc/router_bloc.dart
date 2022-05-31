import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/router/bloc/router_event.dart';
import 'package:xoomie/src/router/bloc/router_state.dart';

class RouterBloc extends Bloc<RouterEventBase, RouterStateBase> {
  RouterBloc() : super(const RouterInitialState()) {
    on<RouterResetEvent>(_onReset);
    on<RouterGoToSignUpMethodEvent>(_onGoToSignUpMethod);
    on<RouterGoToSignUpWithEmailEvent>(_onGoToSignUpWithEmail);
    on<RouterGoToSignInMethodEvent>(_onGoToSignInMethod);
    on<RouterGoToSignInWithEmailEvent>(_onGoToSignInWithEmail);
    on<RouterGoToSignInWithGoogleEvent>(_onGoToSignInWithGoogle);
    on<RouterGoToHomeEvent>(_onGoToHome);
  }

  void _onReset(
    RouterResetEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterInitialState());

  void _onGoToSignUpMethod(
    RouterGoToSignUpMethodEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterSignUpMethodState());

  void _onGoToSignUpWithEmail(
    RouterGoToSignUpWithEmailEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterSignUpWithEmailState());

  void _onGoToSignInMethod(
    RouterGoToSignInMethodEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterSignInMethodState());

  void _onGoToSignInWithEmail(
    RouterGoToSignInWithEmailEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterSignInWithEmailState());

  void _onGoToSignInWithGoogle(
    RouterGoToSignInWithGoogleEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(const RouterSignInWithGoogleState());

  void _onGoToHome(
    RouterGoToHomeEvent event,
    Emitter<RouterStateBase> emit,
  ) =>
      emit(
        RouterHomeState(
          selectedContent: event.selectedContent,
        ),
      );
}
