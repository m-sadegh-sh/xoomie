import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class DefaultTransitionSwitcher extends StatelessWidget {
  final Duration duration;
  final SharedAxisTransitionType transitionType;
  final Widget child;

  const DefaultTransitionSwitcher({
    this.duration = const Duration(milliseconds: 500),
    this.transitionType = SharedAxisTransitionType.vertical,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: duration,
      transitionBuilder: (child, animation, secondaryAnimation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: transitionType,
          fillColor: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }
}

class DefaultWidgetSwitcher extends StatelessWidget {
  final Duration duration;
  final SharedAxisTransitionType transitionType;
  final bool showPrimary;
  final Widget? primary;
  final Widget? secondary;

  const DefaultWidgetSwitcher({
    this.duration = const Duration(milliseconds: 500),
    this.transitionType = SharedAxisTransitionType.vertical,
    required this.showPrimary,
    this.primary,
    this.secondary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTransitionSwitcher(
      duration: duration,
      transitionType: transitionType,
      child: Container(
        key: ValueKey(
          showPrimary ? 'primary' : 'secondary',
        ),
        child: (showPrimary ? primary : secondary) ??
            Visibility(
              visible: false,
              child: Container(),
            ),
      ),
    );
  }
}
