import 'package:xoomie/src/base/bloc/event_base.dart';

abstract class SplashEventBase extends EventBase {
  const SplashEventBase();
}

class SplashInitializeEvent extends SplashEventBase {}
