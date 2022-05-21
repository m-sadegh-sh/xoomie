import 'package:zoomie/src/base/bloc/event_base.dart';

abstract class ThemeEventBase extends EventBase {
  const ThemeEventBase();
}

class ThemeTryDetectEvent extends ThemeEventBase {
  final bool force;

  const ThemeTryDetectEvent({
    this.force = false,
  });

  @override
  List<Object?> get props => [force];
}

class ThemeSwitchEvent extends ThemeEventBase {
  final bool isDark;
  final bool derivedFromSystem;

  const ThemeSwitchEvent({
    required this.isDark,
    this.derivedFromSystem = false,
  });

  @override
  List<Object?> get props => [
        isDark,
        derivedFromSystem,
      ];
}
