import 'package:flutter/material.dart';
import 'package:vomie/src/base/widgets/gradient_background.dart';

abstract class ScreenBase extends StatelessWidget {
  const ScreenBase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      colors: createBackgroundColors(context),
      child: Scaffold(
        appBar: appBar(context),
        body: SafeArea(
          child: buildBody(context),
        ),
        bottomNavigationBar: bottomNavigationBar(context),
        bottomSheet: bottomSheet(context),
      ),
    );
  }

  List<Color> createBackgroundColors(BuildContext context) {
    return [Colors.red];
    // return context.decide(
    //   light: ,
    //   dark: [Colors.blue],
    // );
  }

  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: appBarTitle(context),
    );
  }

  Widget? appBarTitle(BuildContext context) => null;

  Widget? bottomNavigationBar(BuildContext context) => null;

  Widget? bottomSheet(BuildContext context) => null;

  Widget buildBody(BuildContext context);
}
