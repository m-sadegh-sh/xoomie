import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomie/src/auth/bloc/auth_repository.dart';
import 'package:zoomie/src/auth/bloc/auth_state.dart';
import 'package:zoomie/src/auth/bloc/auth_event.dart';
import 'package:zoomie/src/auth/models/user_model.dart';

class AuthBloc extends Bloc<AuthEventBase, AuthStateBase> {
  final AuthRepositoryBase repository;

  late final StreamSubscription _signedInSubscription;
  late final StreamSubscription _signedOutSubscription;

  AuthBloc({
    required this.repository,
  }) : super(const AuthInitialState()) {
    on<AuthAuthenticateEvent>(_onAuthenticate);
    on<AuthAnonymousEvent>(_onAnonymous);

    _signedInSubscription = repository.signedIn().listen(_onSignedIn);
    _signedOutSubscription = repository.signedOut().listen(_onSignedOut);
  }

  @override
  Future<void> close() async {
    await _signedInSubscription.cancel();
    await _signedOutSubscription.cancel();
    await super.close();
  }

  void _onAuthenticate(
    AuthAuthenticateEvent event,
    Emitter<AuthStateBase> emit,
  ) =>
      emit(AuthAuthenticatedState(
        email: event.email,
      ));

  void _onAnonymous(
    AuthAnonymousEvent event,
    Emitter<AuthStateBase> emit,
  ) =>
      emit(const AuthAnonymousState());

  void _onSignedIn(UserModel user) => add(AuthAuthenticateEvent(
        email: user.email,
      ));

  void _onSignedOut(void _) => add(const AuthAnonymousEvent());
}
