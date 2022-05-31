import 'package:xoomie/src/base/bloc/event_base.dart';
import 'package:xoomie/src/router/models/home_contents.dart';

abstract class RouterEventBase extends EventBase {
  const RouterEventBase();
}

class RouterResetEvent extends RouterEventBase {
  const RouterResetEvent();
}

class RouterGoToSignUpMethodEvent extends RouterEventBase {
  const RouterGoToSignUpMethodEvent();
}

class RouterGoToSignUpWithEmailEvent extends RouterEventBase {
  const RouterGoToSignUpWithEmailEvent();
}

class RouterGoToSignInMethodEvent extends RouterEventBase {
  const RouterGoToSignInMethodEvent();
}

class RouterGoToSignInWithEmailEvent extends RouterEventBase {
  const RouterGoToSignInWithEmailEvent();
}

class RouterGoToSignInWithGoogleEvent extends RouterEventBase {
  const RouterGoToSignInWithGoogleEvent();
}

class RouterGoToHomeEvent extends RouterEventBase {
  final HomeContents selectedContent;

  const RouterGoToHomeEvent({
    this.selectedContent = HomeContents.random,
  });

  @override
  List<Object?> get props => [selectedContent];
}
