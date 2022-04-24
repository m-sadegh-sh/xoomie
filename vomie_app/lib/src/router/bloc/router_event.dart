import 'package:vomie/src/auth/models/auth_mode.dart';
import 'package:vomie/src/base/bloc/event_base.dart';
import 'package:vomie/src/router/models/home_contents.dart';

abstract class RouterEventBase extends EventBase {
  const RouterEventBase();
}

class RouterGoToSplashEvent extends RouterEventBase {
  const RouterGoToSplashEvent();
}

class RouterGoToIntroductionEvent extends RouterEventBase {
  const RouterGoToIntroductionEvent();
}

class RouterGoToGettingStartedEvent extends RouterEventBase {
  const RouterGoToGettingStartedEvent();
}

class RouterGoToAuthEvent extends RouterEventBase {
  final AuthMode authMode;

  const RouterGoToAuthEvent({
    required this.authMode,
  });

  @override
  List<Object?> get props => [authMode];
}

class RouterGoToHomeEvent extends RouterEventBase {
  final HomeContents selectedContent;

  const RouterGoToHomeEvent({
    required this.selectedContent,
  });

  @override
  List<Object?> get props => [selectedContent];
}
