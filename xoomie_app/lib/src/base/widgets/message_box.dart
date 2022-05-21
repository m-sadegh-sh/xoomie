import 'package:flutter/material.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/styling/color_palette.dart';
import 'package:xoomie/src/styling/variables.dart';

class MessageBox extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Color color;
  final GenerateLocalizedString? message;

  const MessageBox({
    this.margin,
    required this.color,
    this.message,
    super.key,
  });

  factory MessageBox.error({
    EdgeInsetsGeometry? margin,
    required GenerateLocalizedString? message,
    Key? key,
  }) =>
      MessageBox(
        margin: margin,
        color: errorColor,
        message: message,
        key: key,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: const EdgeInsets.all(paddingMedium),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        border: Border.all(
          color: color,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(borderRadiusMedium),
      ),
      child: LocalizedText(
        message,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
