import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class SignOutRepositoryBase {
  Future<void> signOut();
}

class FirebaseSignOutRepository extends SignOutRepositoryBase {
  FirebaseAuth get auth => FirebaseAuth.instance;

  @override
  Future<void> signOut() => auth.signOut();
}
