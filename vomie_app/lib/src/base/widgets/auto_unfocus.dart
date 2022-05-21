import 'package:flutter/material.dart';

class AutoUnfocus extends StatelessWidget {
  final Widget? child;

  const AutoUnfocus({
    @required this.child,
    super.key,
  });

  static void tryToUnfocus(BuildContext context) {
    final currentScope = FocusScope.of(context);
    if (currentScope.hasPrimaryFocus) return;
    if (!currentScope.hasFocus) return;

    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tryToUnfocus(context),
      child: child,
    );
  }
}
