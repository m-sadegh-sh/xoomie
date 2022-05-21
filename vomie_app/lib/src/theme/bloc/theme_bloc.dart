import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:xoomie/src/theme/bloc/theme_event.dart';
import 'package:xoomie/src/theme/bloc/theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEventBase, ThemeStateBase> {
  late final StreamSubscription _subscription;

  ThemeBloc() : super(const ThemeUnknownState()) {
    on<ThemeTryDetectEvent>(_onTryDetect);
    on<ThemeSwitchEvent>(_onSwitch);

    _subscription = stream.listen(_onStateChanged);

    add(const ThemeTryDetectEvent());
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  void _onTryDetect(
    ThemeTryDetectEvent event,
    Emitter<ThemeStateBase> emit,
  ) {
    if (!event.force) {
      if (state is ThemeDetectedState) {
        if (!(state as ThemeDetectedState).derivedFromSystem) {
          return;
        }
      }
    }

    final brightness = SchedulerBinding.instance.window.platformBrightness;
    final isDark = brightness == Brightness.dark;

    add(ThemeSwitchEvent(
      isDark: isDark,
      derivedFromSystem: true,
    ));
  }

  void _onSwitch(
    ThemeSwitchEvent event,
    Emitter<ThemeStateBase> emit,
  ) =>
      emit(ThemeDetectedState(
        isDark: event.isDark,
        derivedFromSystem: event.derivedFromSystem,
      ));

  void _onStateChanged(ThemeStateBase state) {
    if (state is! ThemeDetectedState) {
      return;
    }

    _updateSystemOverlay(
      brightness: state.brightness,
      color: state.systemBarsColor,
    );
  }

  void _updateSystemOverlay({
    required Brightness brightness,
    required Color color,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemStatusBarContrastEnforced: false,
        statusBarColor: color,
        systemNavigationBarIconBrightness: brightness,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: color,
      ),
    );
  }

  @override
  ThemeStateBase? fromJson(Map<String, dynamic> json) {
    return ThemeStateBase.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeStateBase state) => state.toJson();
}
