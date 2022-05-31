import 'package:flutter/material.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/styling/variables.dart';

class Region extends StatelessWidget {
  final Widget child;

  const Region({
    required this.child,
    super.key,
  });

  factory Region.text({
    required String text,
    TextStyle? style,
    Key? key,
  }) =>
      Region(
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      );

  factory Region.localizedText({
    required GenerateLocalizedString text,
    TextStyle? style,
    Key? key,
  }) =>
      Region(
        child: LocalizedText(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(),
        Container(
          color: theme.canvasColor,
          padding: const EdgeInsets.all(paddingSmall),
          child: child,
        ),
      ],
    );
  }
}
