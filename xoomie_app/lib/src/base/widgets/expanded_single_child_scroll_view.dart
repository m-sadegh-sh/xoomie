import 'package:flutter/material.dart';

class ExpandedSingleChildScrollView extends StatelessWidget {
  final LayoutWidgetBuilder builder;

  const ExpandedSingleChildScrollView({
    required this.builder,
    super.key,
  });

  factory ExpandedSingleChildScrollView.child({
    required Widget child,
    Key? key,
  }) =>
      ExpandedSingleChildScrollView(
        builder: (_, __) => child,
        key: key,
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) => SingleChildScrollView(
        primary: true,
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: builder(context, constraints),
        ),
      ),
    );
  }
}
