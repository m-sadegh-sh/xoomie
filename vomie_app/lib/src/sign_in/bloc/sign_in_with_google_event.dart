import 'package:zoomie/src/base/bloc/event_base.dart';

abstract class SignInWithGoogleEventBase extends EventBase {
  const SignInWithGoogleEventBase();
}

class SignInWithGoogleSignInEvent extends SignInWithGoogleEventBase {
  const SignInWithGoogleSignInEvent();
}
