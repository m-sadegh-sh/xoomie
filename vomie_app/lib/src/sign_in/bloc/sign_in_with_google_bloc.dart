import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_repository.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_with_google_event.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_with_google_state.dart';

class SignInWithGoogleBloc
    extends Bloc<SignInWithGoogleEventBase, SignInWithGoogleStateBase> {
  final SignInRepositoryBase repository;

  SignInWithGoogleBloc({
    required this.repository,
  }) : super(const SignInWithGoogleInitialState()) {
    on<SignInWithGoogleSignInEvent>(_onSignIn);

    add(const SignInWithGoogleSignInEvent());
  }

  Future<void> _onSignIn(
    SignInWithGoogleSignInEvent event,
    Emitter<SignInWithGoogleStateBase> emit,
  ) async {
    try {
      emit(const SignInWithGoogleSigningInState());

      throw Exception("aaa");
      await repository.signInWithGoogle();

      emit(const SignInWithGoogleSignedInState());
    } on FirebaseAuthException catch (e) {
      emit(SignInWithGoogleSignInFailedState(
        (x) => e.message!,
      ));
    } catch (e) {
      emit(SignInWithGoogleSignInFailedState(
        (x) => x.signInWithGoogleBlocSignInFailed,
      ));
    }
  }
}
