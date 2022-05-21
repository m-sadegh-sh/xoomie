import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/theme/bloc/theme_bloc.dart';
import 'package:xoomie/src/theme/bloc/theme_event.dart';

class ThemeObserver extends StatefulWidget {
  final Widget child;

  const ThemeObserver({
    required this.child,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ThemeObserverState();
}

class _ThemeObserverState extends State<ThemeObserver>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      return;
    }

    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    themeBloc.add(const ThemeTryDetectEvent());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
