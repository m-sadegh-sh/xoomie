import 'package:xoomie/src/base/bloc/state_base.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';

abstract class SignOutStateBase extends StateBase {
  const SignOutStateBase();
}

class SignOutInitialState extends SignOutStateBase {
  const SignOutInitialState();
}

class SignOutSigningOutState extends SignOutStateBase {
  const SignOutSigningOutState();
}

class SignOutSignedOutState extends SignOutStateBase {
  const SignOutSignedOutState();
}

class SignOutSignOutFailedState extends SignOutStateBase {
  final GenerateLocalizedString? message;

  const SignOutSignOutFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
