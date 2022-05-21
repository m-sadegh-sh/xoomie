import 'package:zoomie/src/base/bloc/state_base.dart';
import 'package:zoomie/src/base/widgets/localized_text.dart';

abstract class SignInWithGoogleStateBase extends StateBase {
  const SignInWithGoogleStateBase();
}

class SignInWithGoogleInitialState extends SignInWithGoogleStateBase {
  const SignInWithGoogleInitialState();
}

class SignInWithGoogleSigningInState extends SignInWithGoogleStateBase {
  const SignInWithGoogleSigningInState();
}

class SignInWithGoogleSignedInState extends SignInWithGoogleStateBase {
  const SignInWithGoogleSignedInState();
}

class SignInWithGoogleSignInFailedState extends SignInWithGoogleStateBase {
  final GenerateLocalizedString message;

  const SignInWithGoogleSignInFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
