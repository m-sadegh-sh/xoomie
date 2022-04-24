import 'package:flutter/material.dart';
import 'package:vomie/src/base/screens/screen_base.dart';

class UnknownScreen extends ScreenBase {
  const UnknownScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Text(
        '404',
        style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
