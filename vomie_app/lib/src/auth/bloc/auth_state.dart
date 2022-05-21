import 'package:zoomie/src/base/bloc/state_base.dart';

abstract class AuthStateBase extends StateBase {
  const AuthStateBase();
}

class AuthInitialState extends AuthStateBase {
  const AuthInitialState();
}

class AuthAnonymousState extends AuthStateBase {
  const AuthAnonymousState();
}

class AuthAuthenticatedState extends AuthStateBase {
  final String email;

  const AuthAuthenticatedState({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}
