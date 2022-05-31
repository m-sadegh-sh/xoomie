import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:xoomie/src/base/widgets/default_transition_switcher.dart';

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
    super.key,
  });

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
