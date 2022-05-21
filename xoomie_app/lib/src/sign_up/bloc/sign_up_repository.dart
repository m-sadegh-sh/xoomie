import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepositoryBase {
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class FirebaseSignUpRepository extends SignUpRepositoryBase {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
}
