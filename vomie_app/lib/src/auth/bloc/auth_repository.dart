import 'dart:async';
import 'package:olive/extensions.dart';
import 'package:xoomie/src/auth/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryBase {
  Stream<UserModel> signedIn();

  Stream<void> signedOut();
}

class FirebaseAuthRepository extends AuthRepositoryBase {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  @override
  Stream<UserModel> signedIn() {
    return _auth
        .userChanges()
        .exceptNull()
        .map((user) => UserModel(email: user.email!))
        .asBroadcastStream(onCancel: (sub) => sub.cancel());
  }

  @override
  Stream<void> signedOut() {
    return _auth
        .userChanges()
        .whereNull()
        .asBroadcastStream(onCancel: (sub) => sub.cancel());
  }
}
