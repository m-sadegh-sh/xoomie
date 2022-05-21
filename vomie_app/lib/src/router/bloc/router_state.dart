import 'package:zoomie/src/base/bloc/state_base.dart';
import 'package:zoomie/src/router/models/home_contents.dart';

abstract class RouterStateBase extends StateBase {
  const RouterStateBase();
}

class RouterInitialState extends RouterStateBase {
  const RouterInitialState();
}

class RouterSignUpMethodState extends RouterStateBase {
  const RouterSignUpMethodState();
}

abstract class RouterSignUpWithStateBase extends RouterSignUpMethodState {
  const RouterSignUpWithStateBase();
}

class RouterSignUpWithEmailState extends RouterSignUpWithStateBase {
  const RouterSignUpWithEmailState();
}

class RouterSignInMethodState extends RouterStateBase {
  const RouterSignInMethodState();
}

abstract class RouterSignInWithStateBase extends RouterSignInMethodState {
  const RouterSignInWithStateBase();
}

class RouterSignInWithEmailState extends RouterSignInWithStateBase {
  const RouterSignInWithEmailState();
}

class RouterSignInWithGoogleState extends RouterSignInWithStateBase {
  const RouterSignInWithGoogleState();
}

class RouterHomeState extends RouterStateBase {
  final HomeContents selectedContent;

  const RouterHomeState({
    required this.selectedContent,
  });

  @override
  List<Object?> get props => [selectedContent];
}
