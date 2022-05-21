import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:xoomie/src/base/widgets/default_widget_switcher.dart';

class DefaultValueSwitcher<T> extends StatefulWidget {
  final Duration duration;
  final SharedAxisTransitionType transitionType;
  final T? value;
  final Widget? Function(T? value) builder;

  const DefaultValueSwitcher({
    this.duration = const Duration(milliseconds: 500),
    this.transitionType = SharedAxisTransitionType.vertical,
    required this.value,
    required this.builder,
    super.key,
  });

  @override
  DefaultValueSwitcherState<T> createState() => DefaultValueSwitcherState<T>();
}

class DefaultValueSwitcherState<T> extends State<DefaultValueSwitcher<T>> {
  T? firstValue;
  T? secondValue;

  @override
  void initState() {
    super.initState();
    setState(() => firstValue = widget.value);
  }

  @override
  void didUpdateWidget(covariant DefaultValueSwitcher<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      if (firstValue == null) {
        firstValue = widget.value;
        secondValue = null;
      } else {
        firstValue = null;
        secondValue = widget.value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultWidgetSwitcher(
      duration: widget.duration,
      transitionType: widget.transitionType,
      showPrimary: firstValue != null,
      primary: widget.builder(firstValue),
      secondary: widget.builder(secondValue),
    );
  }
}
