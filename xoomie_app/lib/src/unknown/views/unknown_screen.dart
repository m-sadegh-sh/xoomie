import 'package:flutter/material.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';

class UnknownScreen extends ScreenBase {
  const UnknownScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Text(
        '404',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
