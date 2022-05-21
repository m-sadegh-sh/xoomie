import 'package:zoomie/src/base/bloc/event_base.dart';

abstract class SignOutEventBase extends EventBase {
  const SignOutEventBase();
}

class SignOutSignOutEvent extends SignOutEventBase {
  const SignOutSignOutEvent();
}
