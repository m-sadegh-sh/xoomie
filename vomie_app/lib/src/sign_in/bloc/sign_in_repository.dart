import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

abstract class SignInRepositoryBase {
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithGoogle();
}

class FirebaseSignInRepository extends SignInRepositoryBase {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _auth.signInWithCredential(credential);
  }
}
