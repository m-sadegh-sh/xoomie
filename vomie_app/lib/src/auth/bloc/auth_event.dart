import 'package:zoomie/src/base/bloc/event_base.dart';

abstract class AuthEventBase extends EventBase {
  const AuthEventBase();
}

class AuthAuthenticateEvent extends AuthEventBase {
  final String email;

  const AuthAuthenticateEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class AuthAnonymousEvent extends AuthEventBase {
  const AuthAnonymousEvent();
}
