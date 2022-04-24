import 'package:vomie/src/auth/models/auth_mode.dart';
import 'package:vomie/src/base/bloc/state_base.dart';
import 'package:vomie/src/router/models/home_contents.dart';

abstract class RouterStateBase extends StateBase {
  const RouterStateBase();
}

class RouterSplashState extends RouterStateBase {
  const RouterSplashState();
}

class RouterIntroductionState extends RouterStateBase {
  const RouterIntroductionState();
}

class RouterGettingStartedState extends RouterStateBase {
  const RouterGettingStartedState();
}

class RouterAuthState extends RouterStateBase {
  final AuthMode authMode;

  const RouterAuthState({
    required this.authMode,
  });

  @override
  List<Object?> get props => [authMode];
}

class RouterHomeState extends RouterStateBase {
  final HomeContents selectedContent;

  const RouterHomeState({
    required this.selectedContent,
  });

  @override
  List<Object?> get props => [selectedContent];
}
