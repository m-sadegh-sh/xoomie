import 'package:vomie/src/base/bloc/event_base.dart';
import 'package:vomie/src/base/widgets/localized_text.dart';

abstract class SplashEventBase extends EventBase {
  const SplashEventBase();
}

class SplashInitializeEvent extends SplashEventBase {}

class SplashInitializingEvent extends SplashEventBase {
  final GenerateLocalizedString? message;

  const SplashInitializingEvent(this.message);

  @override
  List<Object?> get props => [message];
}

class SplashInitializedEvent extends SplashEventBase {
  const SplashInitializedEvent();
}

class SplashInitializationFailedEvent extends SplashEventBase {
  final GenerateLocalizedString? message;

  const SplashInitializationFailedEvent(this.message);

  @override
  List<Object?> get props => [message];
}
