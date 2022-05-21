import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:zoomie/src/splash/bloc/splash_state.dart';
import 'package:olive/extensions.dart';
import 'package:zoomie/src/splash/bloc/splash_event.dart';

class SplashBloc extends Bloc<SplashEventBase, SplashStateBase> {
  SplashBloc() : super(const SplashInitialState()) {
    on<SplashInitializeEvent>(_onInitialize);

    add(SplashInitializeEvent());
  }

  Future<void> _onInitialize(
    SplashInitializeEvent event,
    Emitter<SplashStateBase> emit,
  ) async {
    try {
      emit(SplashInitializingState(
        (x) => x.splashBlocBootstrapping,
      ));

      await Future.delayed(1.5.seconds());

      emit(SplashInitializingState(
        (x) => x.splashBlocFinishingUp,
      ));

      await Future.delayed(1.5.seconds());

      emit(SplashInitializedState());
    } catch (e) {
      emit(SplashInitializationFailedState(
        (x) => x.splashBlocInitializingFailed,
      ));
    }
  }
}
