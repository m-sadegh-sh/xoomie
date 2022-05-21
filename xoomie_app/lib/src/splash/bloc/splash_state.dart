import 'package:xoomie/src/base/bloc/state_base.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';

abstract class SplashStateBase extends StateBase {
  const SplashStateBase();
}

class SplashInitialState extends SplashStateBase {
  const SplashInitialState();
}

class SplashInitializingState extends SplashStateBase {
  final GenerateLocalizedString? message;

  const SplashInitializingState(this.message);

  @override
  List<Object?> get props => [message];
}

class SplashInitializedState extends SplashStateBase {}

class SplashInitializationFailedState extends SplashStateBase {
  final GenerateLocalizedString? message;

  const SplashInitializationFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
