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
